# Capacity Transformations
capacity <- capacity %>%
  group_by(aea_region, year) %>%
  summarise(
    "acep_region" = acep_region,
    "ft" = sum(ff_turbines),
    "re" = sum(ff_ice),
    "hy" = sum(hydro),
    "wi" = sum(wind),
    "us" = sum(solar),
    "rs" = sum(rooftop_solar),
    "st" = sum(storage),
    "lg" = sum(landfill_gas)
  ) %>%
  pivot_longer(
    cols = c(
      "ft",
      "re",
      "hy", 
      "wi",
      "us",
      "rs",
      "st",
      "lg"
    ),
    names_to = "prime_mover",
    values_to = "capacity"
  )

capacity <- capacity %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "ft", "Fossil Turbines")) %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "re", "Recip Engines")) %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "hy", "Hydro")) %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "wi", "Wind")) %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "us", "Utility Solar")) %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "rs", "Rooftop Solar")) %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "st", "Storage")) %>%
  mutate(prime_mover = replace(prime_mover, prime_mover == "lg", "Landfill Gas"))

# Consumption Transformations
consumption <- subset(consumption, year <= 2019)

consumption = consumption %>%
  mutate_at(
    c(
      "residential_revenue",
      "commercial_revenue",
      "other_revenue",
      "total_revenue",
      "residential_sales",
      "commercial_sales",
      "other_sales",
      "total_sales",
      "residential_customers",
      "commercial_customers",
      "other_customers",
      "total_customers",
      "residential_price",
      "commercial_price",
      "other_price",
      "total_price"
    ),
    as.numeric
  )

consumption <- consumption %>%
  pivot_longer(
    cols = c(
      "residential_revenue",
      "commercial_revenue",
      "other_revenue",
      "total_revenue",
      "residential_sales",
      "commercial_sales",
      "other_sales",
      "total_sales",
      "residential_customers",
      "commercial_customers",
      "other_customers",
      "total_customers",
      "residential_price",
      "commercial_price",
      "other_price",
      "total_price"
    ),
    names_to = c("class",".value"),
    names_sep = "_"
  )

consumption <- consumption %>%
  mutate(class = replace(class, class == "residential", "Residential")) %>%
  mutate(class = replace(class, class == "commercial", "Commercial")) %>%
  mutate(class = replace(class, class == "other", "Other")) %>%
  mutate(class = replace(class, class == "total", "Total"))

# Generation Transformations
generation <- generation %>%
  pivot_longer(
    cols = c(
      "oil",
      "gas",
      "coal",
      "hydro",
      "wind",
      "solar",
      "storage",
      "other"
    ),
    names_to = "fuel_type",
    values_to = "generation"
  )

generation <- generation %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "oil", "Oil")) %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "gas", "Gas")) %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "coal", "Coal")) %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "hydro", "Hydro")) %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "wind", "Wind")) %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "solar", "Solar")) %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "storage", "Storage")) %>%
  mutate(fuel_type = replace(fuel_type, fuel_type == "other", "Other"))

generation$acep_region <- ifelse(
  generation$aea_energy_region == "Railbelt",
  "Railbelt",
  NA
)

generation$acep_region <- ifelse(
  generation$aea_energy_region == "Southeast",
  "Coastal",
  generation$acep_region
)
generation$acep_region <- ifelse(
  generation$aea_energy_region == "Kodiak",
  "Coastal",
  generation$acep_region
)
generation$acep_region <- ifelse(
  generation$aea_energy_region == "Copper River/Chugach",
  "Coastal",
  generation$acep_region
)

generation$acep_region <- ifelse(
  is.na(generation$acep_region),
  "Rural Remote",
  generation$acep_region
)

generation$generation <- ifelse(
  generation$generation == 0.0,
  NA,
  generation$generation
)

# Price Transformations

# Weighted Price Transformations
