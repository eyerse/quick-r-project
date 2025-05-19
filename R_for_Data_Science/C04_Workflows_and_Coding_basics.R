# R as a calculator

1 / 200 * 30
#> [1] 0.15
(59 + 73 + 2) / 3
#> [1] 44.66667
sin(pi / 2)
#> [1] 1


# Object assignment
# say “object name gets value” in your head.
x <- 3 * 4
x

# naming
i_use_snake_case
otherPeopleUseCamelCase
some.people.use.periods
And_aFew.People_RENOUNCEconvention

# fixing typos
this_is_a_really_long_name <- 2.5
# ctrl + ↑ in the console autofills previous commands (type 'this' to filter)
# and enables reassignment 


# Calling functions
# function_name(arg1 = val1, arg2 = val2, ...)
x <= seq(10)
x

# surround in () to print to screen
(x <- seq(10))


# 4.4 Exercises
# 1. Why does this code not work?
  # my_variable <- 10
  # my_varıable
  # #> Error: object 'my_varıable' not found
    # not named the same
 
# 2. Tweak each of the following R commands so that they run correctly:
  library(tidyverse)
  # ggplot(dota = mpg) + 
  #   geom_point(mapping = aes(x = displ, y = hwy))
    ggplot(data=mpg) +
      geom_point(mapping = aes(x = displ, y = hwy))
  # fliter(mpg, cyl = 8)
    filter(mpg, cyl == 8)
  # filter(diamond, carat > 3)
    filter(diamonds, carat > 3)
# 3. Press Alt + Shift + K. What happens? 
    # View Keyboard Shortcuts
  # How can you get to the same place using the menus?
    # Tools > Keyboard Shortcuts Help  


