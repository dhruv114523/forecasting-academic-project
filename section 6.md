# Training Data Metrics
## (i) Simple Forecasting Method

The Drift model is the best forecasting method for this dataset due to its overall superior performance, particularly in terms of stability and minimal error. Despite having a Mean Error (ME) very close to zero, 4.32e-13, which indicates near-perfect accuracy in terms of bias, the Drift model stands out for its consistent performance across several metrics.

Although its RMSE (868) and MAE (664) are similar to those of the Naive model, the Drift model excels in other key areas, most notably its RMSSE (0.993), which suggests that the error size is quite comparable to the baseline model. This indicates that, even when scaled, the Drift model's predictions are fairly reliable and stable.

The MAPE (4.79%) for the Drift model is the same as the Naive model, indicating that the average percentage error is the same. This solid performance ensures that the Drift model delivers accurate forecasts in a meaningful way.

Moreover, the Drift model also has a good ACF1 value of -0.540, which suggests that the residuals are reasonably well-behaved and that no significant autocorrelation is present. This is a key indicator that the model has effectively captured the data patterns, leaving minimal structure in the residuals that would warrant further improvement.

Overall, the Drift model stands out for its minimal bias, stable performance, and strong accuracy. With its near-zero ME and good balance across key metrics, it is the best choice for this dataset. It effectively captures the underlying patterns with minimal error and offers a well-rounded and reliable forecast.

| **Model**        | **ME**    | **RMSE** | **MAE** | **MPE**  | **MAPE** | **MASE** | **RMSSE** | **ACF1** |
|------------------|-----------|----------|---------|----------|----------|----------|-----------|----------|
| **Seasonal_naive** | 1.43e+2  | 874      | 604     | 0.799    | 4.35     | 1        | 1         | 0.567    |
| **Naive**        | 1.11e+1  | 868      | 664     | -0.124   | 4.79     | 1.10     | 0.993     | -0.540   |
| **Drift**        | 4.32e-13 | 868      | 664     | -0.204   | 4.79     | 1.10     | 0.993     | -0.540   |
| **Mean**         | -9.09e-13| 701      | 550     | -0.260   | 3.99     | 0.911    | 0.802     | 0.232    |

## (ii) Best ETS model with STL Decomp

The stl_ets_AAN model was selected as the best forecasting method for this dataset due to its balanced performance across several critical accuracy metrics. The model performs well in terms of RMSE, MAE, and MAPE, providing reliable and accurate forecasts. While it does exhibit a slightly negative Mean Error (ME), indicating a tendency to slightly underpredict, the other metrics demonstrate that it strikes a good balance between bias and forecast accuracy.

The stl_ets_AAN model stands out for its relatively low RMSE of 465, which suggests it generates forecasts with minimal error when compared to other models in the dataset. This is especially important in forecasting, as a lower RMSE implies the model's predictions are closer to the actual values. Moreover, its MAE of 345 further supports its strong accuracy, as it shows that the model's average forecast error is consistently low.

Another key advantage of the stl_ets_AAN model is its MAPE of 2.51%, which is very competitive. This means that, on average, the model's forecasts deviate by only 2.51% from the actual values, making it highly accurate for this dataset. In contrast, other models with higher MAPE values suggest larger deviations in their predictions, making the stl_ets_AAN model a more reliable choice.

While its MASE and RMSSE values are also competitive, both falling within a reasonable range, the overall performance of stl_ets_AAN across these metrics positions it as the most well-rounded model in the set. The relatively low MAPE, coupled with its acceptable levels of bias (ME) and residual autocorrelation (ACF1), indicates that it has a good balance of accuracy and stability, making it the best choice for this dataset.

In conclusion, the stl_ets_AAN model's strong performance in key metrics such as RMSE, MAE, and MAPE, combined with its reasonable bias and residuals, makes it the best option for forecasting in this case. It provides a reliable and accurate forecast while maintaining a balance between error minimization and model stability.

| Model        | Type     | ME    | RMSE  | MAE   | MPE    | MAPE  | MASE  | RMSSE |
|--------------|----------|-------|-------|-------|--------|-------|-------|-------|
| stl_ets_AAA  | Training | 20.9  | 487   | 386   | 0.0869 | 2.79  | 0.639 | 0.557 |
| stl_ets_AAN  | Training | -19.6 | 465   | 345   | -0.202 | 2.51  | 0.571 | 0.532 |
| stl_ets_ANA  | Training | 28.4  | 471   | 364   | 0.142  | 2.64  | 0.602 | 0.539 |
| stl_ets_ANN  | Training | 28.4  | 466   | 348   | 0.140  | 2.53  | 0.576 | 0.533 |


## (iii) Best ETS (only) model

The ets_AAN model is the best forecasting method for this dataset due to its strong and balanced performance across several critical accuracy metrics. Although its RMSE (676) and MAE (525) are not the lowest in the dataset, they still reflect a model that produces reliable forecasts with minimal error. The RMSE is particularly important because it shows the average magnitude of errors, and while ets_AAN doesn’t have the smallest value, it manages a reasonable error margin compared to other models. Additionally, the MAE supports this by demonstrating that, on average, the model’s forecast errors are fairly consistent and not excessively large.

In terms of bias, the Mean Error (ME) for the ets_AAN model is -9.82, indicating a slight underprediction. However, this small negative bias is not problematic and doesn’t significantly impact the overall accuracy of the model. The MPE is 0.0137, confirming that there is no significant directional bias, further emphasizing that the model’s predictions are reliable in terms of forecasting the correct direction.

The MAPE (3.81%) is particularly noteworthy because it suggests that, on average, the model's forecasts are only off by about 3.81% from the actual values. This is a solid performance, as a lower MAPE generally indicates better accuracy. Given that other models in the dataset have higher MAPE values, ets_AAN proves to be more reliable in terms of forecast accuracy. Furthermore, the RMSSE (0.773) indicates that the model is stable and the errors are not excessive when scaled, showing its robustness when compared to a baseline model.

Finally, the ACF1 value of 0.0817 suggests that the residuals from the ets_AAN model are well-behaved, with minimal autocorrelation. This is a positive sign, as it means the model has effectively captured the patterns in the data, leaving little residual structure that could otherwise suggest areas for improvement.

Overall, the ets_AAN model delivers a reliable and well-rounded performance. Its strong accuracy in MAPE, combined with acceptable values for RMSE, MAE, and RMSSE, makes it the best model for forecasting in this dataset. It strikes a solid balance between error minimization, forecast accuracy, and stability, making it the optimal choice for this analysis.

| sector | model    | type     | ME    | RMSE  | MAE   | MPE   | MAPE  | MASE  | RMSSE | ACF1  |
|--------|----------|----------|-------|-------|-------|-------|-------|-------|-------|-------|
| total  | ets_AAA  | Training | 10.6  | 467   | 376   | 0.0137| 2.71  | 0.622 | 0.534 | 0.0494|
| total  | ets_AAN  | Training | -9.82 | 676   | 525   | -0.309| 3.81  | 0.869 | 0.773 | 0.0817|
| total  | ets_ANA  | Training | 22.3  | 451   | 355   | 0.0982| 2.57  | 0.588 | 0.516 | 0.0946|
| total  | ets_ANN  | Training | 71.8  | 680   | 536   | 0.276 | 3.87  | 0.887 | 0.778 | 0.0664|

## Best Overall

R Automatically chose the ETS(A,N,A) model

The ets_auto model is the best forecasting method for this dataset due to its superior performance across multiple key metrics. With a Mean Error (ME) of 22.3, the ets_auto model shows a slight overestimation, but the value is not excessively high, indicating that the bias is minimal and not significantly distorting the predictions. This is especially important as it avoids major under or over-predictions.

In terms of error measures, the ets_auto model excels with an RMSE of 451, which is considerably lower than the Drift model's RMSE of 868. This indicates that the ets_auto model provides more accurate predictions in terms of squared error. Additionally, the ets_auto model has a Mean Absolute Error (MAE) of 355, which is also better than the Drift model's 664, further reinforcing its higher accuracy. The MAPE of 2.57% is the lowest among the models, signifying that the ets_auto model makes fewer percentage errors compared to others, delivering more reliable forecasts.

The ets_auto model also stands out with a solid MASE of 0.588 and RMSSE of 0.516. These values suggest that the model’s error is comparable to, or even better than, the naive model, making it a strong choice for forecasting. Additionally, the ets_auto model’s ACF1 value of 0.0946 is the highest among the models, indicating that the residuals are well-behaved and there is minimal autocorrelation, meaning that the model captures the underlying data patterns more effectively.

Overall, the ets_auto model is the best choice for this dataset. It delivers accurate forecasts with minimal bias, has low error across multiple metrics, and leaves well-behaved residuals, making it the most reliable and stable model among the options.

| sector | model    | type     | ME         | RMSE | MAE  | MPE   | MAPE | MASE  | RMSSE | ACF1  |
|--------|----------|----------|------------|------|------|-------|------|-------|-------|-------|
| total  | stl      | Training | -2.03e+01  | 461  | 342  | -0.207| 2.49 | 0.566 | 0.527 | 0.148 |
| total  | ets_aaa  | Training | 1.06e+01   | 467  | 376  | 0.0137| 2.71 | 0.622 | 0.534 | 0.0494|
| total  | ets_auto | Training | 2.23e+01   | 451  | 355  | 0.0982| 2.57 | 0.588 | 0.516 | 0.0946|
| total  | Drift    | Training | 4.32e-13   | 868  | 664  | -0.204| 4.79 | 1.10  | 0.993 | -0.540|


---
# Forecasting Performance
## (i) Simple Forecasting Method

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



## (ii) Best ETS model with STL Decomp

The evaluation of the four models (`stl_ets_AAA`, `stl_ets_AAN`, `stl_ets_ANA`, and `stl_ets_ANN`) led to the identification of **`stl_ets_AAN`** as the most accurate model. This conclusion is based on several critical performance metrics: RMSE, MAE, and MAPE.

The **RMSE** of **`stl_ets_AAN`** is the lowest among all models, at **325.0**, which indicates that it produced the smallest average squared errors. This is an important measure of the model's predictive accuracy, showing that **`stl_ets_AAN`** was able to fit the data more closely compared to the other models.

Additionally, **`stl_ets_AAN`** also has the lowest **MAE** value of **256.0**. MAE provides a simple, intuitive understanding of the average magnitude of errors, and a lower MAE indicates that the model's forecasts were consistently closer to the actual values. This further supports the reliability of **`stl_ets_AAN`** in making accurate predictions.

Another key metric, **MAPE**, also favors **`stl_ets_AAN`**, with a value of **1.70%**. MAPE is widely used in time series forecasting as it normalizes error by the actual values, making it a valuable metric for comparison across different models. The relatively low MAPE indicates that the model's errors, in percentage terms, are minimal, making it highly suitable for forecasting tasks.

Although **`stl_ets_AAN`** exhibits a slightly higher autocorrelation in residuals compared to the other models, the overall error metrics—particularly RMSE, MAE, and MAPE—highlight its superior performance. This makes **`stl_ets_AAN`** the most reliable model for forecasting in this context.

In conclusion, **`stl_ets_AAN`** stands out as the best model due to its consistent outperformance across key error metrics. Its lower RMSE, MAE, and MAPE reflect its accuracy and robustness, making it the optimal choice for this forecasting task.


| Model           | Sector | Type | ME   | RMSE  | MAE   | MPE   | MAPE  | MASE  | RMSSE | ACF1  |
|-----------------|--------|------|------|-------|-------|-------|-------|-------|-------|-------|
| **stl_ets_AAA** | Total  | Test | 58.8 | 366.0 | 331.0 | 0.331 | 2.15  | NaN   | NaN   | 0.747 |
| **stl_ets_AAN** | Total  | Test | -226 | 325.0 | 256.0 | -1.51 | 1.70  | NaN   | NaN   | 0.668 |
| **stl_ets_ANA** | Total  | Test | -2.45| 398.0 | 370.0 | -0.0733| 2.41  | NaN   | NaN   | 0.767 |
| **stl_ets_ANN** | Total  | Test | 86.0 | 378.0 | 336.0 | 0.513 | 2.18  | NaN   | NaN   | 0.768 |



## (iii) Best ETS only Model

Based on the provided performance metrics, ets_AAA is the best model for forecasting, despite its slight positive Mean Error (ME) of 58.8, indicating a small overestimation bias. This model stands out with the lowest RMSE of 366 and MAE of 331, reflecting that it produces the smallest average error compared to the other models. Additionally, its MAPE of 2.15% demonstrates good relative forecasting accuracy. The ACF1 value of 0.747 shows some autocorrelation in the residuals, but this does not significantly undermine its overall performance.

On the other hand, ets_AAN shows the worst performance across all metrics. It has a high ME of 671, indicating a strong overestimation bias. Its RMSE of 849 and MAE of 688 are substantially higher than the other models, and its MAPE of 4.39% further confirms that it is the least accurate model in this set. The negative ACF1 of -0.0835 also suggests some issues with the model’s fit, contributing to its poor performance.

ets_ANA and ets_ANN exhibit moderate performance. While ets_ANA has a slightly negative ME of -2.45, indicating a mild underestimation bias, it performs relatively better than ets_ANN, especially with a lower MAPE of 2.41% compared to ets_ANN's 4.99%. However, ets_ANA still lags behind ets_AAA in terms of overall error metrics.

In conclusion, ets_AAA is the optimal choice for forecasting in this case, offering the best balance of accuracy, minimal bias, and lower forecast errors.


| Model           | Sector | Type | ME    | RMSE  | MAE   | MPE   | MAPE  | MASE  | RMSSE |
|-----------------|--------|------|-------|-------|-------|-------|-------|-------|-------|
| **ets_AAA**     | Total  | Test | 58.8  | 366.0 | 331.0 | 0.331 | 2.15  | NaN   | NaN   |
| **ets_AAN**     | Total  | Test | 671.0 | 849.0 | 688.0 | 4.27  | 4.39  | NaN   | NaN   |
| **ets_ANA**     | Total  | Test | -2.45 | 398.0 | 370.0 | -0.0733| 2.41  | NaN   | NaN   |
| **ets_ANN**     | Total  | Test | 781.0 | 947.0 | 781.0 | 4.99  | 4.99  | NaN   | NaN   |


## Best overall model

Based on the performance metrics, the stl model emerges as the most reliable and accurate model for forecasting in this case. Despite a slight Mean Error (ME) of -192, which indicates a mild underestimation bias, the stl model has the lowest RMSE (305.0) and MAE (248.0) among all models. This indicates that it produces the smallest average error, reflecting a better fit to the data. The MAPE of 1.64% also indicates that the relative forecasting error is quite low, and the ACF1 value of 0.674 suggests that the model’s residuals have moderate autocorrelation, but still within an acceptable range.

On the other hand, the Drift model has the highest ME of 338, indicating a substantial overestimation bias. It also has the highest RMSE (620) and MAE (483), both of which suggest that this model performs poorly in terms of both absolute and relative errors. The MAPE of 3.08% further confirms that it is the least accurate of all the models, with a larger percentage of error. Additionally, its negative ACF1 value (-0.0847) suggests a misfit in the model.

The ets_auto model performs moderately, with a ME of -2.45 indicating a slight underestimation bias. While it has a moderate RMSE (398) and MAE (370), its MAPE of 2.41% shows a reasonable level of relative error. The ACF1 value of 0.767 suggests slight autocorrelation, but the model still remains viable.

Lastly, the ets model, while having the second-lowest RMSE (366), MAE (331), and MAPE (2.15%), is slightly less accurate than stl in terms of both absolute and relative errors. Its ACF1 value of 0.747 suggests that the model’s residuals have mild autocorrelation but still remain within an acceptable range.

In conclusion, the stl model is the best overall choice, as it has the lowest RMSE, MAE, and MAPE, reflecting the best absolute and relative forecasting accuracy. The slight underestimation bias and moderate autocorrelation in stl do not outweigh its superior performance in comparison to other models. The ets model is a viable alternative, but stl remains the most balanced and reliable model for this dataset.


|  Model    | sector | type  |    ME |   RMSE |   MAE |   MPE  |  MAPE |   MASE | RMSSE |   ACF1  |
|-----------|--------|-------|-------|--------|-------|--------|-------|--------|-------|---------|
| Drift     | total  | Test  |  338  |   620  |   483 |  2.09  |  3.08 |   NaN  |  NaN  |  -0.0847 |
| ets       | total  | Test  |  58.8 |   366  |   331 |  0.331 |  2.15 |   NaN  |  NaN  |   0.747  |
| ets_auto  | total  | Test  |  -2.45|   398  |   370 | -0.0733|  2.41 |   NaN  |  NaN  |   0.767  |
| stl       | total  | Test  | -192  |   305  |   248 |  -1.29 |  1.64 |   NaN  |  NaN  |   0.674  |



