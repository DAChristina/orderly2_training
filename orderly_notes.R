# Analyses are always run more than once

# Name, ID, code, inputs, outputs, metadata


# Complete orderly script consisting of:
analysis.R

library(tidyverse)
library(otherpackages)
d <- read.csv()
result <- run_analysis(d)
write.csv(result, "result.csv")


# yadayada




# Any output can become an input
# using orderly_dependency