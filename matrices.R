# R stores table data in matrices
# matrix[row, column]

#matrix() # bends a vector and fills one column at a time - like a snake
#rbind()
#cbind()

my_data <- 1:20

A <- matrix(my_data, 4, 5)

A[2, 3]

B <- matrix(my_data, 4, 5, byrow = TRUE)

# rbind

r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1, 2, 3)

C <- rbind(r1, r2, r3)

C

# cbind

c1 <- 1:5
c2 <- -1:-5

cbind(c1, c2)

# Naming dimensions - can access rows and columns
#using the row and column names (in quotes)

charlie <- 1:5

# give names

names(charlie) <- c("a", "b", "c", "d", "e")

# clear names

names(charlie) <- NULL

# naming matrix dimensions

temp_vec <- rep(c("a", "B", "zZ"), each = 3)


bravo <- matrix(temp_vec, 3, 3)

rownames(bravo) <- c("How", "are", "you")
colnames(bravo) <- c("X", "Y", "Z")

bravo["are", "Y"] <- 0 # set variable at chosen position

rownames(bravo) <- NULL # reset to no names

### Matrix operations - can divide, multiply and add matrices

Games["LeBronJames", "2012"]

round(FieldGoals / Games, 1)
round(MinutesPlayed / Games)

### Matplot - plots columns of a matrix
# t = transpose rows and columns

matplot(t(FieldGoals), type = "b", pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players,
col = c(1:4, 6), pch = 15:18, horiz = FALSE)

# plot player accuracy
matplot(t(FieldGoals / FieldGoalAttempts), type = "b",
pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players,
col = c(1:4, 6), pch = 15:18, horiz = FALSE)

# points per minute played
matplot(t(Points / MinutesPlayed), type = "b",
pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players,
col = c(1:4, 6), pch = 15:18, horiz = FALSE)

#### subsetting

x <- c("a", "b", "c", "d", "e")

x[c(1, 5)]
x[1]

# subsets that take matrix and output matrix
Games[1:3, 6:10]
Games[c(1, 10), ]
Games[, c("2008", "2009")]

Games[1, ] # doesn't result in matrix output
#- is a vector - as R guesses what you want
#- not a 2 dimentional output so goes with vector

# stops R dropping the 2nd dimention and returns
#same class of object as you had originally
Games[1, , drop = FALSE]

# subset plot
my_dat <- MinutesPlayed[1:3, ]

matplot(t(my_dat), type = "b",
pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players[1:3],
col = c(1:4, 6), pch = 15:18, horiz = FALSE)


my_dat <- MinutesPlayed[1, , drop = FALSE]

matplot(t(my_dat), type = "b",
pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players[1],
col = c(1:4, 6), pch = 15:18, horiz = FALSE)

### Create a function

my_plot <- function(data, player_no = 1:10, players_list = Players) {
    my_dat <- data[player_no, , drop = FALSE]
    matplot(t(my_dat), type = "b",
    pch = 15:18, col = c(1:4, 6))
    legend("bottomleft", inset = 0.01, legend = players_list[player_no],
    col = c(1:4, 6), pch = 15:18, horiz = FALSE)
}

my_plot(Games)

### Basketball insights

my_plot(Salary)
my_plot(Salary / Games) # how much they got paid per game 
#- imjuries lead to discrepencies in results

# In-game Metrics
my_plot((MinutesPlayed))
my_plot(Points)

# In game metrics normalised - to reduce effect of injuries on results
# measures metrics per game that they attended
my_plot(FieldGoals / Games)
my_plot(FieldGoals / FieldGoalAttempts)
my_plot(FieldGoalAttempts / Games)
my_plot(Points / Games)

# Interesting Observation
my_plot(MinutesPlayed / Games)
my_plot(Games)

# Time is valuable - most field goals/minute played
my_plot(FieldGoals / MinutesPlayed)

# Player style
my_plot(Points / FieldGoals)