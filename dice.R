
## Remember you can cancel commands with ctrl + c

# a:b creates an array of all integers between a and b
die <- 1:6

# define a function with default args
roll <- function(size = 2) {
    die <- 1:6
    dice <- sample(die, size = size, replace = TRUE)
    # the last line is what the function returns
    sum(dice)
}

roll()

roll(size = 1)

