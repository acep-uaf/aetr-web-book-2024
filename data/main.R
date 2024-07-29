# Run this script when a new patch is added.

# Library Requirements
library(renv)
library(tidyverse)

# Import the raw data
capacity <- read.csv(file="raw_data/capacity.csv")
generation <- read.csv(file="raw_data/generation.csv")
consumption <- read.csv(file="raw_data/consumption.csv")
prices <- read.csv(file="raw_data/prices.csv")
weighted_prices <- read.csv(file="raw_data/weighted_prices.csv")

# Conduct patches of the raw data
source("patches/apply_patches.R")

# Conduct data transformations
source("transformations/apply_transformations.R")

# Export the final data
write.csv(capacity, file = "final_data/capacity.csv", row.names = FALSE)
write.csv(generation, file = "final_data/generation.csv", row.names = FALSE)
write.csv(consumption, file = "final_data/consumption.csv", row.names = FALSE)
write.csv(prices, file = "final_data/prices.csv", row.names = FALSE)
write.csv(weighted_prices, file = "final_data/weighted_prices.csv", row.names = FALSE)
