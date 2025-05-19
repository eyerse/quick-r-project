# Statistical transformations
library(ggplot2)

# Bar chart calculates new values for the plot!
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

# count is in the chart and not in the df!
head(diamonds)

# bar charts, histograms, and frequency polygons bin your data and 
  # then plot bin counts.
# smoothers fit a model to your data and then plot predictions from the model.
# boxplots compute a robust summary of the distribution and 
  # then display a specially formatted box.

# stat default is "count"
?geom_bar

# geoms and stats can be used interchangably
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))




# override the stat to use the count present in the data
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


# override the default mapping and display proportion
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))
# after_stat() accesses the depreciated #stat()
?after_stat

# show statistical transformation
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

?stat_summary


# 3.7.1 Exercises
# 1. What is the default geom associated with stat_summary()? 
# How could you rewrite the previous plot to use that geom function instead of 
# the stat function?
  # pointrange
diamonds %>% group_by(cut) %>% summarize(median_y = median(depth),
                                         min_y = min(depth),
                                         max_y = max(depth)) %>%
  ggplot() +
  geom_pointrange(mapping = aes(x = cut, y = median_y, ymin = min_y, ymax = max_y))+
  labs(y = 'depth')

#! you have to create the data which is auto created in the stat_* fn

# 2.What does geom_col() do? How is it different to geom_bar()?
  # Both geom_col() and geom_bar() create bar charts. 
  # The major difference is the default stat: stat_count() vs. identity()
  ?geom_col
  ?geom_bar

# 3. Most geoms and stats come in pairs that are almost always used in concert.
  # Read through the documentation and make a list of all the pairs. 
      # https://ggplot2.tidyverse.org/reference/#geoms
  # What do they have in common?
    #  shared name and help page

# 4. What variables does stat_smooth() compute? 
  ?stat_smooth
    # Predicted value.
    # Lower pointwise confidence interval around the mean.
    # Upper pointwise confidence interval around the mean.
    # Standard error.
  # What parameters control its behaviour?
    # The parameters are dependant on the method used to fit the data. 
    # Other features like the level of confidence can be changed

# 5. In our proportion bar chart, we need to set group = 1. Why? 
# In other words what is the problem with these two graphs?
  ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, y = after_stat(prop)))

  ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, y = after_stat(prop), group=1))
  
  # prop is calculated per group i.e. 100% of each group is in each group
  # group = 1 is a dummy grouping to override the default group by x
  ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))

  ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut
                           , fill = color
                           , y = after_stat(prop)
                           , group = color
                           )
             )
  # stacked proportions are misleading, it's much better to dodge  
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = color),
             position = 'dodge')

