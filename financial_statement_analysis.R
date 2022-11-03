#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44,
11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57,
840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

profit_per_month <- round(revenue - expenses, 2)

revenue_after_tax <- round(revenue * 0.7, 2)
profit_after_tax <- round(revenue_after_tax - expenses, 2)

profit_margin <- round((profit_after_tax / revenue) * 100, 0)

mean_profit_after_tax <- mean(profit_after_tax)

max_profit <- round(max(profit_after_tax), 0)
min_profit <- round(min(profit_after_tax), 0)

# good months
for (i in profit_after_tax){
    if (i > mean_profit_after_tax) {
        print(i)
    }
}

good_months <- profit_after_tax > mean_profit_after_tax

bad_months <- !good_months

# bad months
for (i in profit_after_tax){
    if (i < mean_profit_after_tax) {
        print(i)
    }
}

# revenue in 1000s

revenue_1000 <- round(revenue / 1000)
revenue_1000

expenses_1000 <- round(expenses / 1000)

profit_1000 <- round(profit_margin / 1000)
