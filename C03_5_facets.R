# Facets
library(ggplot2)

# Create mini plots with facet_wrap()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  #facet_wrap requires a formula
  facet_wrap(~ class, nrow = 2)

#Make a pair plot with facet_grid()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# To use facet_grid with one variable, replace the other with .
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ displ)

# 3.5.1 Exercises
# What happens if you facet on a continuous variable?
    # you get a uselessnumber of tiny plots
# What do the empty cells in plot with facet_grid(drv ~ cyl) mean? 
# How do they relate to this plot?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))
    #   there are no data points with that combination of facet values

  
# What plots does the following code make? What does . do?
  ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
    # split the plot by drv, the . represents no cols on the facet grid 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
    # split the. plot by cyl; no rows on the facet grid

# Take the first faceted plot in this section:
  ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
# What are the advantages to using faceting instead of the colour aesthetic? 
# What are the disadvantages? 
# How might the balance change if you had a larger dataset?
    #faceting splits out the data so it's not all in a clump
    # it makes it harder to consider the shape of the data as a whole
    # a larger dataset might make it harder to distinguish between colours
  
#   Read ?facet_wrap. What does nrow do? What does ncol do? 
    # these control the layout of the facets
  ?facet_wrap
# What other options control the layout of the individual panels? 
    # scales, shrink, labeller, switch, dir, axes, axis.labels
  
# Why doesn’t facet_grid() have nrow and ncol arguments?
#   the layout is controled by the number of values in each variable
  
# When using facet_grid() you should usually put the variable with more 
# unique levels in the columns. Why?
  # it is easier to read multiple columns than rows? Really depends on display size imo
  