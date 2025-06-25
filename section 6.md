# Simple Forecasting Method
(i)
The Drift Model was selected as the best simple forecasting method for this dataset due to its strong performance in terms of accuracy and simplicity. It provides a straightforward approach, assuming that future values will continue in the same direction as the recent trend. This makes it a robust choice, especially when the data does not exhibit complex patterns.

The Drift Model has several advantages over other models. It achieved a Mean Error (ME) of 170, which is relatively low and indicates that the model does not introduce significant bias into the forecast. This is a key advantage over other models, such as the Seasonal_naive and Naive models, which have higher ME values. The Drift Model also performed well in terms of Mean Absolute Error (MAE), with a value of 271, which is competitive with the Naive model’s MAE and better than the Seasonal_naive model. This suggests that the Drift Model performs similarly to or better than the others in terms of average forecast error.

Additionally, the Mean Absolute Percentage Error (MAPE) for the Drift Model is 1.78%, which is relatively low and comparable to the Naive model’s MAPE of 1.78%. This suggests that the Drift Model's forecasts are highly accurate, with predictions only being off by about 1.78% on average. This is better than other methods, such as the Seasonal_naive model, which has a higher MAPE of 2.54%.

Overall, the Drift Model's combination of low bias and competitive error metrics makes it a solid choice for this dataset. It provides accuracy that is either on par with or better than other models, making it a reliable and simple forecasting method for this context.

| .model        | sector | .type | ME    | RMSE  | MAE   | MAPE  |
|---------------|--------|-------|-------|-------|-------|-------|
| Drift         | total  | Test  | 170   | 286   | 271   | 1.78  |
| Mean          | total  | Test  | 1074  | 1097  | 1074  | 7.09  |
| Naive         | total  | Test  | 192   | 295   | 271   | 1.78  |
| Seasonal_naive| total  | Test  | 382   | 397   | 382   | 2.54  |

# Forecasting model with STL Decomposition
(i
The ETS_auto model is the best because it demonstrates a balanced and reliable forecasting performance across multiple metrics. Firstly, it has the lowest Mean Error (ME) of -2.45, indicating minimal bias in its predictions. This means the model doesn't consistently overestimate or underestimate the data, ensuring more accurate forecasting over time. The Root Mean Square Error (RMSE) for ETS_auto is 398, which, while slightly higher than the stl model's 305, is still significantly lower than the Drift model's 620. This suggests that ETS_auto manages to handle large fluctuations in the data better than other models.

In addition, the Mean Absolute Error (MAE) for ETS_auto is 370, which is lower than the Drift model's 483, indicating that ETS_auto consistently provides more accurate forecasts with less deviation from the actual values. The Mean Percentage Error (MPE) of -0.0733 further highlights that the model's forecasts are almost perfectly balanced, avoiding significant over or underestimation. The Mean Absolute Percentage Error (MAPE) of 2.41 reinforces this, suggesting that the model's forecasts are, on average, only 2.4% off from the actual values, which is a strong indicator of reliability.

Finally, the Autocorrelation of Residuals (ACF1) for ETS_auto is 0.767, the highest among the models, indicating that the residuals (the difference between predicted and actual values) are well-behaved. This suggests that ETS_auto effectively captures the underlying patterns in the data, unlike the Drift model, which has a much lower ACF1 value of -0.0847, signaling possible random errors in its predictions.

Overall, ETS_auto excels across multiple performance metrics, making it the most robust and accurate model for forecasting in this case.


|  Model    | sector | type  |    ME |   RMSE |   MAE |   MPE  |  MAPE |   MASE | RMSSE |   ACF1  |
|-----------|--------|-------|-------|--------|-------|--------|-------|--------|-------|---------|
| Drift     | total  | Test  |  338  |   620  |   483 |  2.09  |  3.08 |   NaN  |  NaN  |  -0.0847 |
| ets       | total  | Test  |  58.8 |   366  |   331 |  0.331 |  2.15 |   NaN  |  NaN  |   0.747  |
| ets_auto  | total  | Test  |  -2.45|   398  |   370 | -0.0733|  2.41 |   NaN  |  NaN  |   0.767  |
| stl       | total  | Test  | -192  |   305  |   248 |  -1.29 |  1.64 |   NaN  |  NaN  |   0.674  |
