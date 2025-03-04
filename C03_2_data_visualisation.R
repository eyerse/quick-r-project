library(tidyverse)

# ggplot contains a dataset on vehicles
ggplot2::mpg

# access the docs on the dataset
## LOVE that they are so easily seen in RStudio!!
?mpg

#ggplot() creates a coord system, we then layer on top
ggplot(data = mpg) + 
  # geom_point adds a layer of points i.e. a scatter plot
  # aes() tells the points which cols of data to map to x and y axes
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data=mpg) +
  geom_point(aes(x=class, y=drv))

# 3.2.4 Exercises
# Run ggplot(data = mpg). What do you see?
#       ggplot makes an empty axes plot, even though it has data attached
#   How many rows are in mpg? How many columns?
#       mpg is a tibble of 234 rows x 11 cols
#   What does the drv variable describe? Read the help for ?mpg to find out.
#       drv is the type of drive train
# Make a scatterplot of hwy vs cyl.
#       ggplot(data=mpg) +
#           geom_point(aes(x=hwy, y=cyl))
# What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
#     these are both discrete (categorical) variables. Scatter plots need continuous
#     or high granularity ordered discrete variables to be useful
# 

