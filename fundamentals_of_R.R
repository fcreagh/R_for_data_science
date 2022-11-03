# Vectors

my_first_vector <- c(3, 45, 56, 732)

is.numeric(my_first_vector)

is.integer(my_first_vector) # numbers stored as double by default in anticipation of mathematical equations used down the line

is.double(my_first_vector)

v2 <- c(3L, 45L, 56L, 732L) # adding L specifies it to integer type
is.integer(v2)

v3 <- c("a", "B23", "Hello", 7) # vector must contain same data type only
v3
is.character(v3)
is.numeric(v3)

seq(1,15) #sequence
1:15
rep() # replicate

seq(1, 15, 2)

z <- seq(1,15,4)
z

rep(3, 100)
d <- rep(3, 50)
d

rep("a", 10)

x <- c(80, 20) # replicate a vector
rep(x, 10)

# Square brackets
w <- c("a", "b", "c", "d", "e")

w[1]

w[2]

w[-1] # all elements except the first one

w[1:3]

w[c(1, 3, 5)]

w[-3:-5]

# Vectorised operations -  can just add one vector to another and R will do it for you
vector1 <- c(1, 2, 3, 4, 5)
vector2 <- c(4, 5, 6, 7, 8)

vector1 + vector2
vector1 - vector2
vector1 / vector2

x <- rnorm(5)
x

# R specific programming loop
for (i in x) {
    print(i)
}

print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

# conventional programming loop
for (j in 1:5){
    print(x[j])
}

# ----------------------- 2nd part
N <- 100
a <- rnorm(N)
b <- rnorm(N)

# Vectorised approach - faster
# R delegates to C and fortran in the background - acts as a wrapper for other languages to perform it's hard labour for it - R only has to pass this information on 
# 1 time in vectorised approach but many times in a loop  - this is where the time is saved

c <- a * b

# De-vectorised approach - element by element

d <- rep(NA, N) # empty vector with 100 spaces

for (i in 1:N) {
    d[i] <- a[i] * b[i]
}

# R functions

paste()
sqrt()

?typeof()

# library = the folder where packages are stored
#install.packages("ggplot2") # install package
library(ggplot2) # activate package

qplot(data = diamonds, carat, price,
    colour = clarity, facets = .~clarity)