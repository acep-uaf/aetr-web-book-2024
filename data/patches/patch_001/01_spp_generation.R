# This patch adds annual FERC1 data to EIA-923 to make whole the SPP generation.

# Add missing MLP SPP data
generation <- generation %>%
  mutate(
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2013,
      gas + 376802,
      gas
    ),
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2014,
      gas + 392146,
      gas
    ),
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2015,
      gas + 338331,
      gas
    ),
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2016,
      gas + 373982,
      gas
    ),
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2017,
      gas + 372998,
      gas
    ),
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2018,
      gas + 389111,
      gas
    ),
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2019,
      gas + 386258.472,
      gas
    ),
    gas = ifelse(
      plant_name == "Southcentral Power Project" & year == 2020,
      1125773.9,
      gas
    )
  )

# Modify the data source column
generation <- generation %>%
  mutate(
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2013,
      "EIA923, FERC1",
      source
    ),
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2014,
      "EIA923, FERC1",
      source
    ),
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2015,
      "EIA923, FERC1",
      source
    ),
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2016,
      "EIA923, FERC1",
      source
    ),
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2017,
      "EIA923, FERC1",
      source
    ),
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2018,
      "EIA923, FERC1",
      source
    ),
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2019,
      "EIA923, FERC1",
      source
    ),
    source = ifelse(
      plant_name == "Southcentral Power Project" & year == 2020,
      "FERC1",
      source
    )
  )