# Stage 2
library(fpp3)
library(ggplot2)

electricity_consumption <- read.csv("https://storage.data.gov.my/energy/electricity_consumption.csv")
str(electricity_consumption)
head(electricity_consumption)

electricity_ts <- electricity_consumption %>%
  filter(sector == "total") %>%
  mutate(date = yearmonth(date)) %>%
  as_tsibble(index = date, key = sector)

# Stage 3
# First plot: Total Monthly Electricity Consumption
electricity_ts %>%
  autoplot(consumption) +
  labs(title = "Total Monthly Electricity Consumption in Malaysia", 
       y = "Consumption (MKWh)", x = "Date")

# Second plot: Seasonal plot
electricity_ts %>%
  gg_season(consumption) +
  labs(title = "Total Monthly Electricity Consumption in Malaysia", 
       y = "Consumption (MKWh)", x = "Date")

# STL decomposition
stl_dcmp <- electricity_ts %>%
  model(
    stl = STL(consumption ~ season(window = "periodic"))
  ) %>%
  components()

# Seasonally adjusted plot
stl_dcmp %>%
  as_tsibble() %>%
  autoplot(season_adjust) +
  labs(x = "Date (Monthly)", 
       y = "Electricity Consumption (MKWh)", 
       title = "Seasonally Adjusted Electricity Consumption in Malaysia")

# Stage 4
full_dataset <- electricity_ts

# Stage 5: Split into training and test
training_set <- full_dataset %>%
  filter(date >= yearmonth("2018-07") & date <= yearmonth("2023-06"))

test_set <- full_dataset %>%
  filter(date > yearmonth("2023-06"))

# Stage 6: Fit models
fit <- training_set %>%
  model(
    stl = decomposition_model(
      STL(consumption),
      ETS(season_adjust ~ error("A") + trend("A") + season("N"))
    ),
    ets = ETS(consumption ~ error("A") + trend("A") + season("A")),
    ets_auto = ETS(consumption),
    Drift = RW(consumption ~ drift())
  )

fit_basic_models <- training_set %>% # for part (i)
  model(
    Seasonal_naive= SNAIVE(consumption),
    Naive = NAIVE(consumption),
    Drift = RW(consumption ~ drift()),
    Mean = MEAN(consumption)
  )

augment(fit_basic_models) %>%
  ggplot(aes(x = date)) + 
  geom_line(aes(y = consumption)) + 
  geom_line(aes(y = .fitted, col = .model)) +
  facet_wrap(~.model, nrow = 2) +
  labs(x = "Date (Monthly)", y = "Electricity Consumption (MKWh)", title = "Fitted values vs Training sets by Methods and Models")

fit_basic_models %>% accuracy()

# Step 1: Forecast the models on the test set
forecasted_values <- fit_basic_models %>%
  forecast(h = length(test_set))

# Step 2: Evaluate accuracy of the forecasts on the test set
accuracy(forecasted_values, test_set)

predictions <- fit_basic_models %>%
  forecast(h = nrow(test_set)) # h = number of periods in the test set

results <- predictions %>%
  left_join(test_set, by = "date")

fc_2 <- fit_basic_models %>%
  forecast(h = 12)

# Plot the forecasted values along with the test set and training set
fc_2 %>%
  autoplot(full_dataset, level = NULL) +  # Plot the forecast against the full dataset
  autolayer(test_set, consumption) +       # Add the actual test set values
  labs(x = "Date (Monthly)", y = "Electricity Consumption (MKWh)", 
       title = "Fitted and Forecasted Values vs Actual Test Set") +
  theme_minimal()


# Step 2: Combine the actual test set with the predicted values
results <- predictions %>%
  left_join(test_set, by = "date")  # join on the 'date' column or appropriate time identifier

# Step 3: Calculate Accuracy Metrics on Test Set
accuracy_results <- accuracy(predictions, test_set)
print(accuracy_results)


# Augment the fit and visualize
augment(fit) %>%
  ggplot(aes(x = date)) + 
  geom_line(aes(y = consumption)) + 
  geom_line(aes(y = .fitted, col = .model)) +
  facet_wrap(~.model, nrow = 2) +
  labs(x = "Date (Monthly)", y = "Electricity Consumption (MKWh)", title = "Fitted values vs Training sets by Methods and Models")

# Accuracy check
fit %>% accuracy()

# Residual diagnostics
fit %>% select(ets) %>% gg_tsresiduals()

# Produce forecast
fc <- fit %>% forecast(h = 12)

# Plot the forecast
fc %>%
  autoplot(full_dataset, level = NULL) +
  autolayer(test_set, consumption)

accuracy_results <- accuracy(fc, test_set)
print(accuracy_results)

model_ets_auto <- fit$ets_auto
print(model_ets_auto)

# Zoom-in plot
energy_zoom <- full_dataset %>%
  filter_index("2023-06" ~ .)

fc %>%
  autoplot(energy_zoom, level = NULL) +
  autolayer(test_set, consumption, color = "black") +
  labs(title = "Zoom-In version (Starting from 2023-06)", x = "Date (Monthly)", y = "Electricity Consumption (MKWh)") +
  theme_minimal()

# Stage 7: Traditional forecasting and cross-validation
fc_traditional <- fit %>%
  forecast(h = 12)

accuracy(fc_traditional, test_set)

stl_dcmp <- electricity_ts %>%
  model(
    stl = STL(consumption ~ season(window = "periodic"))
  ) %>%
  components()

# Apply various models to the seasonally adjusted data
fit_models <- stl_dcmp %>%
  model(
    drift = RW(season_adjust ~ drift()),    # Drift model
    mean = MEAN(season_adjust),             # Mean model
    naive = NAIVE(season_adjust),           # Naive model
    seasonal_naive = SNAIVE(season_adjust),  # Seasonal Naive model
    ets_aaa = ETS(season_adjust ~ error("A") + trend("A") + season("A"))
  )

forecasts_drift <- fit_models %>%
  select(drift) %>%
  forecast(h = nrow(test_set))

forecasts_mean <- fit_models %>%
  select(mean) %>%
  forecast(h = nrow(test_set))

forecasts_naive <- fit_models %>%
  select(naive) %>%
  forecast(h = nrow(test_set))

forecasts_seasonal_naive <- fit_models %>%
  select(seasonal_naive) %>%
  forecast(h = nrow(test_set))

forecasts_stl <- fit_models %>%
  select(ets_aaa) %>%
  forecast(h = nrow(test_set))

# Combine the individual forecasts into one data frame
all_forecasts <- bind_rows(
  forecasts_drift,
  forecasts_mean,
  forecasts_naive,
  forecasts_seasonal_naive,
  forecasts_stl
)
# Join the forecasts with the test set data for evaluation
results <- all_forecasts %>%
  left_join(test_set, by = "date")

# Perform accuracy check
accuracy_results <- accuracy(all_forecasts, test_set)

# Print the accuracy results
print(accuracy_results)

# Cross-validation
cv_energy <- full_dataset %>%
  stretch_tsibble(.init = 24, .step = 1)

fc_1 <- cv_energy %>%
  model(
    drift = RW(consumption ~ drift()),
    stl = decomposition_model(
      STL(consumption),
      ETS(season_adjust ~ error("A") + trend("A") + season("N"))
    ),
    ets = ETS(consumption ~ error("A") + trend("A") + season("A")),
    ets_auto = ETS(consumption)
  ) %>%
  forecast(h = 12) %>%
  group_by(.id, .model) %>%
  mutate(h = row_number()) %>%
  ungroup() %>%
  as_fable(response = "consumption", distribution = "consumption")

fc_1 %>%
  accuracy(full_dataset, by = c("h", ".model")) %>%
  ggplot(aes(x = h, y = RMSE, col = .model)) +
  geom_point() +
  scale_x_continuous(breaks = seq(1:12))

fc_1 %>%
  accuracy(full_dataset, by = c("h", ".model")) %>%
  ggplot(aes(x = h, y = ME, col = .model)) + 
  geom_point()

accuracy(fc_1, test_set)


# Stage 8: Final Model and Forecast
selected_model <- full_dataset %>%
  model(stl = STL(consumption ~ error("A") + trend("A") + season("A")))

fc_future <- forecast(selected_model, h = 24)

fc_future %>%
  autoplot(full_dataset) +
  labs(title = "24-Month Electricity Consumption Forecast Using ETS(AAA)", 
       x = "Date (Monthly)", y = "Electricity Consumption (MKWh)") +
  theme_minimal()
