generation <- generation %>%
    # Adding the missing data for TNSG North and South Plants, 2012-13
    add_row(
        year = 2012,
        plant_name = "TNSG North Plant",
        gas = 35559.0,
        aea_energy_region = "North Slope",
        source = "EIA923",
        data_version = "Final"
    ) %>%
    add_row(
        year = 2012,
        plant_name = "TNSG South Plant",
        gas = 35559.0,
        aea_energy_region = "North Slope",
        source = "EIA923",
        data_version = "Final"
    ) %>%
    add_row(
        year = 2013,
        plant_name = "TNSG North Plant",
        gas = 60500.0,
        aea_energy_region = "North Slope",
        source = "EIA923",
        data_version = "Final"
    ) %>%
    add_row(
        year = 2013,
        plant_name = "TNSG South Plant",
        gas = 10677.0,
        aea_energy_region = "North Slope",
        source = "EIA923",
        data_version = "Final"
    )