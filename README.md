# Malaysian Electricity Consumption Forecasting

This academic project explores monthly electricity consumption in Malaysia and compares time-series forecasting methods for the total-consumption series. The analysis is implemented primarily in `forecasting.R`; `section 6.md` records interpretations and accuracy results, and `forecasting_project.Rmd` contains an additional exploratory analysis.

## Data and preparation

The main R script downloads the public electricity-consumption dataset from [data.gov.my](https://storage.data.gov.my/energy/electricity_consumption.csv). Before fitting forecasts, it:

1. Inspects the downloaded data and keeps rows where `sector` is `"total"`.
2. Converts `date` to a monthly `yearmonth` index and stores the observations as a `tsibble`.
3. Plots the monthly series and its seasonal pattern, then uses STL decomposition to examine the trend, seasonal component, and seasonally adjusted series.
4. Splits the observations into a training period from July 2018 through June 2023 and a test period containing later observations.

The supplementary R Markdown file reads `electricity_consumption.csv` from the working directory rather than downloading it, and explores the series with time-series, seasonal, and subseries plots.

## Forecasting methods compared

The script fits and evaluates these methods:

- **Baselines:** mean, naive, seasonal naive, and random walk with drift.
- **Exponential smoothing (ETS):** additive error/trend/seasonal specifications and an automatically selected ETS model.
- **STL-based models:** STL decomposition followed by ETS on the seasonally adjusted series, as well as mean, naive, seasonal naive, and drift forecasts of the adjusted series.

Fitted values and residual diagnostics are inspected, and forecasts are compared against the test period using forecast accuracy measures such as ME, RMSE, MAE, and MAPE. The script also uses rolling-origin time-series cross-validation with an initial window of 24 observations, one-step increments, and a 12-month forecast horizon. A final section produces a 24-month forecast.

The reported findings in `section 6.md` favor different methods depending on the comparison: Drift among the simple baseline methods, STL-ETS AAN in the documented STL-ETS comparison, and STL in the overall test-set comparison. The preferred model therefore depends on the evaluation group and metric; consult the tables in that file for the reported values.

## Running the analysis

Use R with the `fpp3` package installed. Run `forecasting.R` from the repository directory; it downloads the dataset directly, so an internet connection is required. The R Markdown analysis additionally requires a local `electricity_consumption.csv` file.

**Current script caveat:** the STL-adjusted forecasting block in `forecasting.R` combines `forecasts_stl` even though that object is not defined in the script. As a result, the script currently needs that reference resolved before it can run through all later sections. The R Markdown file also refers to `ts_data` in its seasonal plot without defining it.
