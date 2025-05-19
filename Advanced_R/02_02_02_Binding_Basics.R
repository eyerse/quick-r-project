library(lobstr)

# assignment binds a variable name to an object in memory
x <- c(1, 2, 3)
y <- x
y

# assignment is transitive
obj_addr(x) == obj_addr(y)
obj_addr(x)

#--------------------------------------------------------------
# 2.2.2 Exercises
#--------------------------------------------------------------

# 1. Explain the relationship between a, b, c and d in the following code:
  a <- 1:10
  b <- a
  c <- b
  d <- 1:10
  # a <- 1:10 instantiates an object in memory and points a to it
  # b and c create further bindings to that same object
  # d <- 1:10 instantiates an identical, but separate object and points to it
obj_addr(a) == obj_addr(d)
  
# 2. The following code accesses the mean function in multiple ways.
# Do they all point to the same underlying function object? 
# Verify this with lobstr::obj_addr().
  mean
  base::mean
  get("mean")
  evalq(mean)
  match.fun("mean")
  # I expect them to be the same function object
  obj_addr(mean) == obj_addr(match.fun("mean"))

# 3. By default, base R data import functions, like read.csv(), 
# will automatically convert non-syntactic names to syntactic ones. 
# Why might this be problematic? 
  # silent changing of variable names is always prone to bugs!
  # e.g. two distinct names may be converted to the same name
# What option allows you to suppress this behaviour?
  ?read.csv
  # check.names:	if TRUE adjusts (by make.names) and forces no duplicates.

# 4. What rules does make.names() use to convert non-syntactic names into syntactic ones?
  ?make.names
  # The character "X" is prepended if necessary. 
  # All invalid characters are translated to ".". 
  # A missing value is translated to "NA". 
  # Names which match R keywords have a dot appended to them. 
  # Duplicated values are altered by make.unique.
  
# 5. I slightly simplified the rules that govern syntactic names. 
# Why is .123e1 not a syntactic name? Read ?make.names for the full details.
  make.names(".123e1")
  # .d is forbidden ("." followed by a digit)
