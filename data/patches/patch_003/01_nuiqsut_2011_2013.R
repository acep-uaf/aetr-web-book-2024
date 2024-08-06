generation <- generation %>%
    # Adding the missing data for Nuiqsut, 2011-13
    add_row(
        year = 2011,
        plant_name = "NSB Nuiqsut Utility",
        gas = 1475.46,
        oil = 1753.54,
        aea_energy_region = "North Slope",
        source = "EIA923",
        data_version = "Final"
    ) %>%
    add_row(
        year = 2012,
        plant_name = "NSB Nuiqsut Utility",
        gas = 1416.82,
        oil = 2047.18,
        aea_energy_region = "North Slope",
        source = "EIA923",
        data_version = "Final"
    ) %>%
    add_row(
        year = 2013,
        plant_name = "NSB Nuiqsut Utility",
        gas = 4688.14,
        oil = 1235.85,
        aea_energy_region = "North Slope",
        source = "EIA923",
        data_version = "Final"
    )