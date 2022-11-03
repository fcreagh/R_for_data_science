#library("ggplot2")

#mydata <- read.csv(file.choose())

#ggplot(data = mydata,
#       aes(x = carat, y = price))
#        geom_point(alpha = 0.1)
#        geom_smooth()

#  the L tells R to store the variable as an integer
x <- 2L
typeof(x)

# double type  - anything with decimal point - default storage type

y <- 2.5
typeof(y)

# complex

z <- 3 + 2i
typeof(z)

# character

a <- "h"
typeof(a)

# logical
q <- TRUE
typeof(q)

A <- 10
B <- 5

C <- A + B

var1 <- 2.5
var2 <- 4

var1 - var2

greeting <- "hello"
name <- "Frances"

message <- paste(greeting, name)

# Logical operators can be true or false

4 < 5

# | or
# ! not
# & and
# isTRUE(x)

while(TRUE){
    print("Hello")
}

counter <- 1
while (counter < 12) {
    print(counter)
    counter <- counter + 1
}

# for loop

counter <- 1
while (counter < 12) {
    print(counter)
    counter <- counter + 1
}

for (i in 1:5) {
    print("HelloR")
}

# if statement

rm(answer)
x <- rnorm(1)

if (x > 1) {
    answer <- "Greater than 1"
} else if (x >= 1) {
        answer <- "Between -1 and 1"
} else {
        answer <- "less than -1"
}
