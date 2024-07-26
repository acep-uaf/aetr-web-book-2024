# This script is run when a new patch is detected. It patches the raw data
# and then transforms it into a distributed version (final).

# Library Requirements
library(renv)
library(tidyverse)

# Import the raw data
capacity <- read.csv(file="data/raw_data/capacity.csv")
generation <- read.csv(file="data/raw_data/generation.csv")
consumption <- read.csv(file="data/raw_data/consumption.csv")
prices <- read.csv(file="data/raw_data/prices.csv")
weighted_prices <- read.csv(file="data/raw_data/weighted_prices.csv")

# Conduct patches of the raw data
source("data/patches/apply_patches.R")

# Conduct data transformations
source("data/transformations/apply_transformations.R")

# Export the final data
write.csv(capacity, file = "data/final_data/capacity.csv", row.names = FALSE)
write.csv(generation, file = "data/final_data/generation.csv", row.names = FALSE)
write.csv(consumption, file = "data/final_data/consumption.csv", row.names = FALSE)
write.csv(prices, file = "data/final_data/prices.csv", row.names = FALSE)
write.csv(weighted_prices, file = "data/final_data/weighted_prices.csv", row.names = FALSE)
