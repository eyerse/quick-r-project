# ----------------------------------------
# 2.5 Modify-in-place

# For loops are traditionally considered slow in R
x <- data.frame(matrix(runif(5 * 1e4), ncol = 5))
medians <- vapply(x, median, numeric(1))

for (i in seq_along(medians)) {
  x[[i]] <- x[[i]] - medians[[i]]
}

# this loop copies the df at each iteration three times
cat(tracemem(x), "\n")
for (i in 1:5) {
  x[[i]] <- x[[i]] - medians[[i]]
}

# list modification is much faster

y <- as.list(x)
cat(tracemem(y), "\n")
#> <0x7f80c5c3de20>

for (i in 1:5) {
  y[[i]] <- y[[i]] - medians[[i]]
}


# ----------------------------------------
# 2.5.3 Exercises
# ----------------------------------------

# 1. Explain why the following code doesn’t create a circular list.
  x <- list()
  x[[1]] <- x
  # copy-on-modify prevents an infinite recursion
  
# 2. Wrap the two methods for subtracting medians into two functions, 
  df <- data.frame(matrix(runif(5 * 1e4), ncol = 5))
  medians <- vapply(df, median, numeric(1))
  x <- as.list(df)

  df_medians <- function(my_df = df, my_medians = medians){
    for (i in seq_along(medians)) {
      df[[i]] <- df[[i]] - medians[[i]]
    }
  df
  }  
  
  ls_medians <- function(my_x = x, my_medians= medians){
    for (i in seq_along(medians)) {
      x[[i]] <- x[[i]] - medians[[i]]
    }
  x
  }
  df_medians()
  ls_medians()
  
  # then use the ‘bench’ package to carefully compare their speeds. 
  library(bench)
  mark(df_medians())
  mark(ls_medians())
  # How does performance change as the number of columns increase?
    # WOW

# 3. What happens if you attempt to use tracemem() on an environment?
  e1 <- rlang::env()
  tracemem(e1) # not useful lol
  