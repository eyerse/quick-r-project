# ----------------------------------------
# 2.3.1 Copy-on-modify

x <- c(1, 2, 3)
y <- x

# modifying one of the names bound to an object creates a new object
# i.e. breaks the shared binding
y[[3]] <- 4
x
y

# trace memory address
cat(tracemem(x), "\n")

y <- x
y[[3]] <- 4L
#! NOTE R 4.2.0 seems to have broken this - or is it RStudio? Works in terminal
y[[3]] <- 5L

# turn off tracing
untracemem(x)


# ----------------------------------------
# 2.3.2 Function Calls

f <- function(a) {
  a
}

x <- c(1, 2, 3)
cat(tracemem(x), "\n")

z <- f(x)
# there's no copy here!

untracemem(x)

# ----------------------------------------
# 2.3.3 Lists

# a list doesn't store values, it stores references to values
l1 <- list(1, 2, 3)
l2 <- l1
# copy-on-modify as with vectors
l2[[3]] <- 4
# this is however a shallow copy
ref(l1, l2) # note the common references 

# ----------------------------------------
# 2.3.4 Data frames
# Data frames are lists of vectors
d1 <- data.frame(x = c(1, 5, 6), y = c(2, 4, 3))

d2 <- d1
# modifying a column only touches one vector
d2[, 2] <- d2[, 2] * 2

d3 <- d1
# modifying a row touches ALL vectors
d3[1, ] <- d3[1, ] * 3


# ----------------------------------------
# 2.3.5 Character vectors
x <- c("a", "a", "abc", "d")
# see the global string pool in action
ref(x, character = TRUE)



# ----------------------------------------
# 2.3.6 Exercises
# ----------------------------------------


# 1. Why is tracemem(1:10) not useful?
  # only named objects can be traced

# 2. Explain why tracemem() shows two copies when you run this code. 
#! RStudio breaks this - be sure to run as a block/in terminal to see desired
# behaviour
  x <- c(1L, 2L, 3L)
  tracemem(x)
  x[[3]] <- 4
  
  # vectors have to be homogeneous so assigning a double forces the integers
  # to also become doubles i.e. copy-on-modify
  
  # assigning an explicit integer avoids the copy
  x <- c(1L, 2L, 3L)
  tracemem(x)
  x[[3]] <- 4L
  
# 3. Sketch out the relationship between the following objects:
  a <- 1:10
  b <- list(a, a)
  c <- list(b, a, 1:10)
  # a is bound to an immutable object I
  # b is a list of references to I
  # c is a list of two references to I and a reference to I2
  # I2 is the same value as I, but a different object in memory
  ref(c)
# 4. What happens when you run this code?
  x <- list(1:10)
  x[[2]] <- x
  # Draw a picture.
  ref(x)
  # initially x was a reference to a single element list containing a reference
  # to the integer vector 1:10
  # upon adding another element to the list x, it is copied(-on-modification)
  # but shallowly - both elements are references to the same object
  