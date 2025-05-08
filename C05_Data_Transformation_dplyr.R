#  Coordinate systems
library(nycflights13)
library(tidyverse)

# explore dplyr basic data manipulation verbs
flights
View(flights)

?flights

## filter
jan1 <- filter(flights, month == 1, day == 1)

(dec25 <- filter(flights, month == 12, day == 25))

filter(flights, month == 11 | month == 12)

summarise(group_by(filter(flights, month == 11 | month == 12), month), n=n())

nov_dec <- filter(flights, month %in% c(11, 12))


### filter with NAs
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)

filter(df, is.na(x) | x > 1)


# .2.4 Exercises
# 1. Find all flights that

  # Had an arrival delay of two or more hours
    filter(flights, arr_delay >= 120 )

  # Flew to Houston (IAH or HOU)
    filter(flights, dest == 'IAH' | dest == 'HOU')
  
  # Were operated by United, American, or Delta
    filter(flights, carrier %in% c('UA', 'AA', 'DL'))
    
  # Departed in summer (July, August, and September)
    filter(flights, month %in% c(7,8,9)) 
    filter(flights, between(month, 7,9))
    
  # Arrived more than two hours late, but didn’t leave late
    filter(flights, arr_delay > 120 & dep_delay <= 0)
    
  # Were delayed by at least an hour, but made up over 30 minutes in flight
    filter(flights, arr_delay < 30 & dep_delay > 60)
    
  # Departed between midnight and 6am (inclusive)
    filter(flights, dep_time >=0 & dep_time <= 0600)
    filter(flights, between(dep_time, 0, 0600))

# 2. Another useful dplyr filtering helper is between(). What does it do? 
  ?between #shortcut for x >= left & x <= right
# Can you use it to simplify the code needed to answer the previous challenges?
    
# 3.How many flights have a missing dep_time? What other variables are missing? What might these rows represent?
    count(filter(flights, is.na(dep_time)))
    # missing dep_delay, arr_time, arr_delay
    # future flights?
    
# 4.Why is NA ^ 0 not missing? 
  # everything ^0 == 1
    
# Why is NA | TRUE not missing? 
    # one evals to TRUE

# Why is FALSE & NA not missing? 
    # one evals to False
# Can you figure out the general rule? (NA * 0 is a tricky counterexample!)
    # consider NA as a placeholder for any possible value?
    Inf ^ 0
    Inf * 0
    ######## WHY R???? WHY???? both are indeterminate smh
    
