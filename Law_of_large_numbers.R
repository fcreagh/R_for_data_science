# Test the law of large numbers for N random normally distributed numbers with mean = 0, sd = 1, E(X) = 68.2%

sample_number <- 10000

counter <- 0

for (i in rnorm(sample_number)) {
    if (i >= -1 & i <= 1) {
        counter <- counter + 1
    }
}

answer <- (counter / sample_number) * 100

answer