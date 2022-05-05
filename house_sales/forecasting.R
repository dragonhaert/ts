house_prices <- read.csv('Insert path here')
attach(house_prices)
library(quantmod)
library(forecast)
library(ggplot2)

sales = na.locf(Price, fromLast = TRUE)
sales = ts(sales, start = c(2007,2), frequency = 12)
plot(sales)
summary(sales)
sales
house_prices

# forecasting with monthly averages

naive__trend = naive(sales, h=24)
plot(naive__trend)
summary(naive__trend)

ses_trend <- ses(sales)
plot(ses_trend)

holt_trend = holt(sales, h = 24)
plot(holt_trend)
summary(holt_trend)

holt_damped = holt(sales, h =24, damped = T)
plot(holt_damped)
summary(holt_damped)

arima_forecast = auto.arima(sales)
plot(forecast(arima_forecast,h=24))
summary(arima_forecast)



# forecasting with 5 month moving averages
ma_sales = ma(sales,5)
plot(ma_sales)

ma_naive_trend = naive(ma_sales, h=24)
plot(ma_naive_trend)
summary(ma_naive_trend)

ma_ses_trend <- ses(ma_sales)
plot(ma_ses_trend)

ma_holt_trend = holt(ma_sales, h = 24)
summary(ma_holt_trend)
plot(ma_holt_trend)

ma_holt_damped = holt(ma_sales, h = 24, damped = T)
summary(ma_holt_damped)
plot(ma_holt_damped)

ma_arima_forecast = auto.arima(ma_sales)
summary(ma_arima_forecast)
plot(forecast(ma_arima_forecast,h=24))

accuracy(naive__trend)
accuracy(ses_trend)
accuracy(holt_trend)
accuracy(holt_damped)
accuracy(arima_forecast)
accuracy(ma_naive_trend)
accuracy(ma_ses_trend)
accuracy(ma_holt_trend)
accuracy(ma_holt_damped)
accuracy(ma_arima_forecast)
