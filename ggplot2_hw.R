rm(list = ls())

setwd("/home/frances/Documents/R_course")
movie_dat <- read.csv("Section6-Homework-Data.csv")
movie_dat$Genre <- factor(movie_dat$Genre)
movie_dat$Studio <- factor(movie_dat$Studio)

library(ggplot2)

filt1 <- (movie_dat$Genre == "action") |
        (movie_dat$Genre == "adventure") |
        (movie_dat$Genre == "animation") |
        (movie_dat$Genre == "comedy") |
        (movie_dat$Genre == "drama")

filt2 <- (movie_dat$Studio == "Buena Vista Studios") |
    (movie_dat$Studio == "Fox") |
    (movie_dat$Studio == "Paramount Pictures") |
    (movie_dat$Studio == "Sony") |
    (movie_dat$Studio == "Universal") |
    (movie_dat$Studio == "WB")


movie_dat2 <- movie_dat[filt1 & filt2, ]

# created the graph
base_plot <- ggplot(data = movie_dat2, aes(x = Genre, y = Gross...US))

box_plot <- base_plot + geom_jitter(aes(size = Budget...mill.,
    colour = Studio)) +
    geom_boxplot(size = 0.4, alpha = 0.5, colour = "Black", outlier.colour = NA)

# make pretty
box_plot2 <- box_plot + xlab("Genre") +
    ylab("Gross % US") +
    ggtitle("Domestic Gross % by Genre") +
    theme(axis.title.x = element_text(colour = "Blue", size = 30),
    axis.title.y = element_text(colour = "Blue", size = 30),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20),
    plot.title = element_text(size = 30, hjust = 0.5),
    legend.text = element_text(size = 20),
    legend.title =  element_text(size = 20),
    text = element_text(family = "Comic Sans MS"))

box_plot2$labels$size <- "Budget $M"

box_plot2
