# load packages with the library command
library(ggplot2)

# c concats the args into a vector
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)

y <- x^3

#qplot is the quick plot function
# qplot(x, y)
# qplot is depreciated

df <- data.frame(x = x, y=y)

ggplot(df)
