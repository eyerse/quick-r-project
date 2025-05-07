# Position Adjustments
library(ggplot2)

# aes() fill and colour both colour a bar chart
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# fill mapped to a variable auto stacks the bars
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

# position arg controls the bar position!
# identity overlaps (use alpha!)
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
# (or just the outline with fill = NA)
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

# position = 'fill' makes each stacked bar the same height (fills the plotarea)
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# position = 'dodge' offsets the bars
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")



# position = 'jitter' is good for fixing overplotting
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

# SO USEFUL IT'S BEEN ALIASSED!!
# geom_point(position = "jitter"): geom_jitter()


# 3.8.1 Exercises
# 1. What is the problem with this plot? How could you improve it?
#   ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
#   geom_point()
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_jitter()

# 2.What parameters to geom_jitter() control the amount of jittering?
  ?geom_jitter
  # width, heigh control max amount of jitter
# 3.Compare and contrast geom_jitter() with geom_count().
  # Both geom_jitter() and geom_count() fix overplotting
  # geom_jitter() adds jitter, sacrificing statistical accuracy 
  # geom_count() counts the overlapping points, and maps to point size
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_count()
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_jitter()
   
# 4. What’s the default position adjustment for geom_boxplot()? 
  ?geom_boxplot # dodge2
# Create a visualisation of the mpg dataset that demonstrates it.
  ggplot(mpg, mapping = aes(x = hwy, y = drv, color = fl)) +
    geom_boxplot(position = 'dodge2')
