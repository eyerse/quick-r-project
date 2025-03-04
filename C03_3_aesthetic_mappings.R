library(tidyverse)

# add a variable to the colo(u)r param of aes()
# to split the data into categories
# this is known as scaling
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

#aesthetics define visual properties that you can map 
#to variables to display information about the data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#these can also be set for the whole plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

mpg

?mpg

# 3.3.1 Exercises
# What’s gone wrong with this code? Why are the points not blue?
#   ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

    # the colour is set inside aes which maps a variable 'blue' to different colours
# 
# Which variables in mpg are categorical? Which variables are continuous? 
# (Hint: type ?mpg to read the documentation for the dataset).
    # displ is the only strictly continuous
# How can you see this information when you run mpg?
    # mpg displays a tibble with col types under col names. dbl is cont.

#   Map a continuous variable to color, size, and shape. How do these 
# aesthetics behave differently for categorical vs. continuous variables?
    ggplot(mpg) +
      geom_point(aes(x=hwy, y=cty, colour=displ))
    # continuous colour spectrum for cont. variables
   
#   What happens if you map the same variable to multiple aesthetics?
    ggplot(mpg) +
      geom_point(aes(x=hwy, y=cty, colour=displ, size=displ))
    # varies in both aes
    
#   What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
    ggplot(mpg) +
      geom_point(aes(x=hwy, y=cty, stroke=displ, colour=displ), shape=1)
    # changes line thickness
    
# What happens if you map an aesthetic to something other than a variable name,
    # like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
    ggplot(mpg) +
      geom_point(aes(x=hwy, y=cty, stroke=displ, colour=displ < 5), shape=1)
    # oooh you can pass boolean operators and conditions to aes!! Noice
    
    