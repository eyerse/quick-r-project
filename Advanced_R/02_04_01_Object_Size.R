# ----------------------------------------
# 2.4 Object Size
library(lobstr)

?obj_size

obj_size(letters)
obj_size(ggplot2::diamonds)

# 1e6 random observations of uniform dist[0, 1]
x <- runif(1e6)
obj_size(x)

# lists are just collections of references i.e. don't balloon
y <- list(x, x, x)
obj_size(y)

#combined size is size of the larger
obj_size(x, y)

banana <- "bananas bananas bananas"
obj_size(banana)
obj_size(rep(banana, 100))


# R only stores the first and last number!!
obj_size(1:3)
#> 680 B
obj_size(1:1e3)
#> 680 B
obj_size(1:1e6)
#> 680 B
obj_size(1:1e9)
#> 680 B

# ----------------------------------------
# 2.4.1 Exercises
# ----------------------------------------

# 1. In the following example, why are object.size(y) and obj_size(y)
# so radically different? # Consult the documentation of object.size().
  y <- rep(list(runif(1e4)), 100)
  object.size(y)
  obj_size(y)
  
  ?object.size() #does not detect if elements of a list are shared
  
# 2. Take the following list. Why is its size somewhat misleading?
  funs <- list(mean, sd, var)
  obj_size(funs)
  #> 18.76 kB
  # why are we measuring the size of built-in functions? 
  # these won't be stored in memory
  
# 3. Predict the output of the following code:
  a <- runif(1e6)
  obj_size(a) #8MB
   
  b <- list(a, a)
  obj_size(b) # 8MB
  obj_size(a, b) # 8MB
  
  b[[1]][[1]] <- 10 # modify first element of first copy of a
  obj_size(b) # 16MB - b now contains distinct vectors
  obj_size(a, b) # 16MB - intersection of a and b == a
  
  b[[2]][[1]] <- 10 # modify the first element of the second copy of a
  obj_size(b) # 16MB - separately instantiated values don't know they match
  obj_size(a, b) # 24MB - a and b are now distinct
  




