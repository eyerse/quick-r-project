# quick-r-project

Repo to explore statistical modelling in R

Follows the Projects from [**R for Data Science**](https://r4ds.had.co.nz)

This repo contains the scripts to match the exercises in *R for Data Science*. They follow the naming convention C\<Chapter\>\_*\<*ChapterSubSection\>\_\<descriptivetitle\>.R

## Quick Start

1.  Download R
2.  Set CRAN mirror (cloud is recommended)
3.  run env_setup.R

## R Handbook Chapters

3.  Data Visualisation
4.  Workflow: basics
5.  Data Transformation

------------------------------------------------------------------------

## Resources Log

Documenting resources as I find them

-   Lot's of knowledge [RStudio education](https://education.rstudio.com/learn/beginner/)

-   Plotting

    -   Useful plotting guide [ggplot guide](https://ggplot2-book.org/getting-started)

    -   Package Reference [ggplot2](https://ggplot2.tidyverse.org/reference/index.html)

    -   [The Layered Grammar of Graphics](http://vita.had.co.nz/papers/layered-grammar.pdf)

-   Welcome to R

    -   Potentially useful tutorial? [Hands-On Programming with R](https://rstudio-education.github.io/hopr/index.html)

------------------------------------------------------------------------

## Fun things learned along the way

Did you know that:

-   CRAN stands for the **c**omprehensive **R** **a**rchive **n**etwork
-   `dbl` data type (double i.e. Real Numbers) is so named because it uses [FP64](https://en.wikipedia.org/wiki/Double-precision_floating-point_format) (single would be [FP32](https://en.wikipedia.org/wiki/Single-precision_floating-point_format))

------------------------------------------------------------------------

## This isn't python

### Data Types

-   `dbl` stands for doubles, or real numbers.

-   `chr` stands for character vectors, or strings.

-   `dttm` stands for date-times (a date + a time).

-   `lgl` stands for logical, vectors that contain only TRUE or FALSE.

-   `fctr` stands for factors, which R uses to represent categorical variables with fixed possible values.

-   `date` stands for dates.

### dplyr != pandas

-   Pick observations by their values `filter()`

-   Reorder the rows `arrange()`

-   Pick variables by their names `select()`

-   Create new variables with functions of existing variables `mutate()`

-   Collapse many values down to a single summary `summarise()`

------------------------------------------------------------------------

## Helpful functions

-   [dput: Write an Object to a File or Recreate it](https://rdrr.io/r/base/dput.html)

-   [formula](http://127.0.0.1:25663/help/library/base/help/formula) and [\~](http://127.0.0.1:25663/help/library/stats/help/~)
