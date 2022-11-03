setwd("/home/frances/Documents/R_course")

# ----------------------------- data 
movies <- read.csv("P2-Movie-Ratings.csv")
colnames(movies) <- c("Film", "Genre",
    "CriticRating", "AudienceRating", "BudgetMillions", "Year")

summary(movies)
str((movies))

# setting data as factors - character data with levels/groupings
movies$Year <- factor(movies$Year)

movies$Film <- factor(movies$Film)

movies$Genre <- factor(movies$Genre)

# --------------------- Aesthetics - aes()
library(ggplot2)

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

# Add geometry
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating)) +
    geom_point()

# Add colour
ggplot(data = movies, aes(x = CriticRating,
    y = AudienceRating, colour = Genre)) +
    geom_point()

# Add size
ggplot(data = movies, aes(x = CriticRating,
    y = AudienceRating, colour = Genre, size = BudgetMillions)) +
    geom_point()
# this #1 - will improve this graph later

# -------------------------- Geometries
# Plotting with layers
# literally add each layer to the object you are creating
plot_object <- ggplot(data = movies, aes(x = CriticRating,
    y = AudienceRating, colour = Genre, size = BudgetMillions))

# points
plot_object + geom_point()

# line
plot_object + geom_line()

# multiple layers
plot_object + geom_line() + geom_point()

# ------------------------------ overriding aesthetics
my_plot <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
    colour = Genre, size = BudgetMillions))

# add geom layer
my_plot + geom_point()

# overriding aes
# eg1 - change the size
my_plot + geom_point(aes(size = CriticRating))

# eg2 change the colour
my_plot + geom_point(aes(colour = BudgetMillions))

# eg3 - change x axis - mapping aes
my_plot + geom_point(aes(x = BudgetMillions)) +
    xlab("Budget Millions $$$")

# eg4 - reduce line size - setting aes
my_plot + geom_line(size = 1) + geom_point()

# --------------------- mapping vs setting
my_plot2 <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

# mapping - mapping colour to some data
my_plot2 + geom_point(aes(colour = Genre))

# setting - to a set colour
my_plot2 + geom_point(colour = Genre)

#ERROR: - can't map a set colour
#my_plot2 <- geom_point(aes(colour = "DarkGreen"))

#1 mapping

my_plot2 + geom_point(aes(size = BudgetMillions))

# Setting

my_plot2 + geom_point(size = 10)

# ------------------------ Histograms and density charts

hist_1 <- ggplot(data = movies, aes(x = BudgetMillions))

hist_1 + geom_histogram(binwidth = 10)

# add colour = fill 
hist_1 + geom_histogram(binwidth = 10, aes(fill = Genre))

# add a border = colour
hist_1 + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")
# chart no3 -  will improve

# -------------------------- Density charts - not commonly used
hist_1 + geom_density(aes(fill = Genre), position = "stack")

# --------------- starting layer tips
# if know you are just looking at AudienceRating

t_plot <- ggplot(data = movies, aes(x = AudienceRating))

t_plot + geom_histogram(binwidth = 10,
    fill = "White", colour = "Blue")

# another way - if you want more flexibility
# overriding is not great code practise

t_plot <- ggplot(data = movies)

t_plot + geom_histogram(binwidth = 10,
    aes(x = AudienceRating),
    fill = "White", colour = "Blue")

# plot 4 for presentation

t_plot <- ggplot(data = movies)

t_plot + geom_histogram(binwidth = 10,
    aes(x = CriticRating),
    fill = "White", colour = "Blue")
# plot 5 presentation

# skeleton plot - when using on different datasets - rare

plot_me <- ggplot()

# --------------------------- statistical transformations

#geom_smooth() - observe trends and relationships when many points on chart

ge_smooth <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
        colour = Genre))

ge_smooth + geom_point() + geom_smooth(fill = NA)

# boxplots - execs like box plots
box_plt <- ggplot(data = movies, aes(x = Genre, y = AudienceRating,
    colour = Genre))

box_plt + geom_boxplot(size  = 1.2)
box_plt + geom_boxplot(size  = 1.2) + geom_point()

# hack: - jitter throws points around randomly
box_plt + geom_boxplot(size  = 1.2) + geom_jitter()

# put boxes on top - plot 6 for presentation
box_plt + geom_jitter() + geom_boxplot(size  = 1.2, alpha = 0.5)

# critic rating - and save graph as .png
png("box_plot.png")

box_plt <- ggplot(data = movies, aes(x = Genre, y = CriticRating,
    colour = Genre))

box_plt + geom_jitter() + geom_boxplot(size  = 1.2, alpha = 0.5)

dev.off()

# -------------------- using facets
v_plot <- ggplot(data = movies, aes(x = BudgetMillions))

v_plot + geom_histogram(binwidth = 10, aes(fill = Genre),
    colour = "Black")

# facets - facet_grid(rows~columns)
v_plot + geom_histogram(binwidth = 10, aes(fill = Genre),
    colour = "Black") +
    facet_grid(Genre ~ ., scales = "free")

# Scatter plot facet
w_plot <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
    colour = Genre))

w_plot + geom_point(size = 3) +
    facet_grid(. ~ Year)

w_plot + geom_point(size = 3) +
    facet_grid(Genre ~ .)

w_plot + geom_point(aes(size = BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre ~ Year)

# -------------------------------- coordinates
m_plot <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
    size = BudgetMillions,
    colour = Genre))

m_plot + geom_point() +
    xlim(50, 100) +
    ylim(50, 100)

# won't always work well - cut off any data above that
# limit rather then zooming in
n_plot <- ggplot(data = movies, aes(x = BudgetMillions))
n_plot + geom_histogram(binwidth = 10, aes(fill = Genre, colour = "Black")) +
    ylim(0, 50)

# instead - zoom
n_plot + geom_histogram(binwidth = 10, aes(fill = Genre, colour = "Black")) +
    coord_cartesian(ylim = c(0, 50))

# improve #1
w_plot <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
    colour = Genre))

w_plot + geom_point(aes(size = BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre ~ Year) +
    coord_cartesian(ylim = c(0, 100))

# ---------------------------- adding themes
o_plot <- ggplot(data = movies, aes(x = BudgetMillions))

hist_ob <- o_plot + geom_histogram(binwidth = 10, aes(fill = Genre),
    colour = "Black")

# axes labels
hist_ob + xlab("Money Axis") +
    ylab("Number of Movies")

# label formatting # final histogram for presentation

hist_ob + xlab("Money Axis") +
    ylab("Number of Movies") +
    ggtitle("Movie Budget Distribution") +
    theme(axis.title.x = element_text(colour = "DarkGreen", size = 30),
    axis.title.y = element_text(colour = "Red", size = 30),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20),
    legend.title = element_text(size = 30),
    legend.text = element_text(size = 20),
    legend.position = c(1, 1),
    legend.justification = c(1, 1),
    plot.title = element_text(colour = "DarkBlue",
    size = 40,
    family = "Courier"))