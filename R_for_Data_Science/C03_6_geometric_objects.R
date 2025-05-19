# Geometric Objects
library(ggplot2)

# A geom is the geometrical object that a plot uses to represent data. 
# e.g. bar charts use bar geoms, line charts use line geoms, scatterplots use
# point geoms


# scatter
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# smooth line
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))


# set the group aesthetic to a categorical variable to draw multiple objects
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

# ggplot2 will also automatically group the data for these geoms 
# whenever you map an aesthetic to a discrete variable
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )


# Every geom function in ggplot2 takes a mapping argument
# but not every aesthetic works with every geom
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv,  color = drv)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))


# avoid this type of repetition by passing a set of mappings to ggplot()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# overwrite global mappings in a layer
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# overwrite layer data
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)


## 3.6.1 Exercises
  # 1. What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
      geom_line() # linechart
      geom_boxplot() # boxplot
      geom_histogram() # histogram
      geom_area() # area chart

  # 2. Run this code in your head and predict what the output will look like. 
  # Then, run the code in R and check your predictions.
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
        geom_point() +
        geom_smooth(se = FALSE)
        #I expect a scatterplot of displ~hwy grouped and coloured by drv
        # with the best fit lines (also coloured)
      
  # 3. What does show.legend = FALSE do? What happens if you remove it?
  # Why do you think I used it earlier in the chapter?
      # hides legend, shows the legend, made plots comprable
      
  # 4. What does the se argument to geom_smooth() do?
      # Display confidence interval around smooth
      ?geom_smooth
      
  # 5. Will these two graphs look different? Why/why not?
      # identical graphs - the top is shorthand for the bottom
      
    # ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    # geom_point() +
    # geom_smooth()

    # ggplot() +
    #   geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
    #   geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

  # 6. Recreate the R code necessary to generate the following graphs.
    ggplot(data=mpg, mapping=aes(x = displ, y = hwy)) +
      geom_point() +
      geom_smooth(se=FALSE)
    
    ggplot(data=mpg, mapping=aes(x = displ, y = hwy)) +
      geom_point() +
      geom_smooth(se=FALSE, mapping=aes(group=drv))
    
    ggplot(data=mpg, mapping=aes(x = displ, y = hwy, colour = drv)) +
      geom_point() +
      geom_smooth(se=FALSE)
    
    ggplot(data=mpg, mapping=aes(x = displ, y = hwy)) +
      geom_point(mapping = aes(colour = drv)) +
      geom_smooth(se=FALSE, color='blue')
    
    ggplot(data=mpg, mapping=aes(x = displ, y = hwy)) +
      geom_point(mapping = aes(colour = drv)) +
      geom_smooth(se=FALSE, color='blue', mapping = aes(linetype = drv))

    ggplot(data=mpg, mapping=aes(x = displ, y = hwy, colour = drv)) +
      geom_point(size=5, colour='white') +
      geom_point()
