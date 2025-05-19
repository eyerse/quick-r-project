#  Coordinate systems
library(ggplot2)

# The default coordinate system is the Cartesian coordinate system
# other systems are occasionaly helpful

# coord_flip() switches the x and y axes
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

# coord_quickmap() sets the aspect ratio correctly for maps
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

# coord_polar() uses polar coordinates
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

 
# 3.9.1 Exercises
# 1. Turn a stacked bar chart into a pie chart using coord_polar().
  ggplot(diamonds, mapping = aes(x = cut, fill=color)) +
    geom_bar(aes(y = after_stat(prop)
            , group = color)) +
    coord_polar()

# 2. What does labs() do? Read the documentation.
  # https://ggplot2-book.org/annotations#sec-titles
  ?labs() # modify labels
# 3. What’s the difference between coord_quickmap() and coord_map()?
  ?coord_quickmap()
  ?coord_map()  
  # quick map dispenses with the need to model the earth as a sphere 
  # and thus is faster and preserves straight lines
  # best in small, equatorial regions 
  
# 4.What does the plot below tell you about the relationship 
  # between city and highway mpg? 
    # effectively linearly dependant cty = hwy + c
  # Why is coord_fixed() important? 
    ?coord_fixed # forces a specified ratio
    # enables true visual comparison
  # What does geom_abline() do?
    ?geom_abline # plot diagonal line
    
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline() +
  coord_fixed()
