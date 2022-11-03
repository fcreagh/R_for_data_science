# dataframes can mix data types while matrices can't
setwd("/home/frances/Documents/R_course")
stats <- read.csv("P2-Demographic-Data.csv")

#--------------------------------------------------------#
# Exploring dataframes
head(stats, n = 10)
nrow(stats)
ncol(stats)
dim(stats)
tail(stats)

str(stats) # shows info on data
summary(stats)

#--------------------------------------------------------#
# Using $ sign
stats[3, 3]
stats[3, "Birth.rate"]

stats$Birth.rate
stats$Internet.users

stats$Internet.users[2]

#levels(stats$Income.Group) 
# levels tells you levels of a factor

#-------------------------------------------------------#
# Basic dataframe operations
stats[1:10, ] # subsetting
stats[c(4, 100), ]

is.data.frame(stats[1, ]) # extracting 1 row = stays as df

stats[, 1, drop = FALSE] # single column is not a df unless use drop=FALSE

# multiply column
head(stats)

stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

stats$MyCalc <- stats$Birth.rate * stats$Internet.users

# test understanding - recycles a short vector across the whole df
# short vector must be a multiple of the long vector
stats$xyz <- 1:5
head(stats, n = 12)

# remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL

#-------------------------------------------------------#
# Filtering a df
filter <- stats$Internet.users < 2

stats[filter, ] # will display the TRUE rows only

stats[stats$Birth.rate > 40, ] # 40 people born / 1000 people each yr
stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]
stats[stats$Income.Group == "High income", ]

levels(stats$Income.Group)

stats[stats$Country.Name == "Malta", ]

#-------------------------------------------------------#
# qplot

library(ggplot2)

qplot(data = stats, x = Internet.users)
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3))
# when assign colour or size - surround with I()
# then will be treated as is instead of trying to map to the data
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3),
    colour = I("blue"))

qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3),
    colour = I("blue"), geom = "boxplot")

#-------------------------------------------------------#
# visualising what we need
qplot(data = stats, x = Internet.users, y = Birth.rate,
    size = I(4), colour = I("green"))

qplot(data = stats, x = Internet.users, y = Birth.rate,
    size = I(5), colour = Income.Group)

#-------------------------------------------------------#
# Create df
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset,
    Regions_2012_Dataset)

colnames(mydf) <- c("Country", "Code", "Region")

rm(mydf)

# OR change names & create at same time
mydf <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset,
    Region = Regions_2012_Dataset)

head(mydf)
tail(mydf)
summary(mydf)

#-------------------------------------------------------#
# Merging dataframes
head(stats)
head(mydf)

big_df <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
big_df$Country <- NULL

qplot(data = big_df, x = Internet.users, y = Birth.rate,
    size = I(5), colour = Region)

# shapes
qplot(data = big_df, x = Internet.users, y = Birth.rate,
    size = I(5), colour = Region, shape = I(17))

# transparency
qplot(data = big_df, x = Internet.users, y = Birth.rate,
    size = I(5), colour = Region, shape = I(19),
    alpha = I(0.6),
    main = "Birth Rate vs Internet Users")