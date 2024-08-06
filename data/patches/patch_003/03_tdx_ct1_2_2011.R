generation <- generation %>%
    # Adding the missing data for TDX Generating CT1 and CT2 Plants, 2011
    add_row(
        year = 2011,
        plant_name = "TDX CT1/CT2",
        gas = 60377.31766,
        oil = 181.8623355,
        aea_energy_region = "North Slope",
        source = "RCA, TA153-227",
        data_version = "RCA"
    )