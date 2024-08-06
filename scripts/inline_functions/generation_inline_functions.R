################################################################################
# Regional compound average growth rate
#
# Attributes
#   - region: ACEP region (string), of ["Coastal","Railbelt","Rural Remote", "Statewide"]
#   - year1: First year of comparison (integer), default=2011
#   - year2: Second year of comparison (integer), default=2021
#   - decimals: Number of decimals for rounding (integer), default=2
################################################################################
##
#

cagr <- function(region, year1=2011, year2=2021, decimals=2) {
  
  # Dataframe declaration
  df = regional_generation_data
  
  # Define the number of periods
  n = year2 - year1
  
  # Statewide CAGR
  if (region == "Statewide") {
    # Generation in year 1
    gen_1 = sum((df[["total_gen"]][df$year == year1]))
    
    # Generation in year 1
    gen_2 = sum((df[["total_gen"]][df$year == year2]))
    
  }
  
  # Regional CAGR
  if (region != "Statewide") {
    # Generation in year 1
    gen_1 = (df[["total_gen"]][df$acep_region == region & df$year == year1])
    
    # Generation in year 2
    gen_2 = (df[["total_gen"]][df$acep_region == region & df$year == year2])
  }
  
  # Compound Average Growth Rate Calculation
  result = (((gen_2 / gen_1)^(1/n)) - 1)*100
  
  # Output the rounded CAGR to the specified decimal place as a string
  formatC(round(result, decimals), format="g")
}

################################################################################
# Regional generation by year
#
# Attributes
#   - region: ACEP region (string), of ["Coastal","Railbelt","Rural Remote"]
#   - year: Calendar year of interest (integer), default=NULL
#           NULL default results in average across all years
#   - mwh: Convert result from GWh to MWh (boolean), default=FALSE
#   - decimals: Number of decimals for rounding (integer), default=2
################################################################################
##
#

regional_generation <- function(region, year=NULL, mwh=FALSE ,decimals=2) {
  
  # Dataframe declaration
  df = regional_generation_data
  
  # Series average generation
  if (is.null(year)) {
    result = mean(df[["total_gen"]][df$acep_region == region], na.rm=TRUE)
  }
  
  # Yearly generation
  if (!is.null(year)) {
    result = mean(df[["total_gen"]][df$acep_region == region & df$year == year], na.rm=TRUE)
  }
  
  # Convert to MWh (Optional)
  if (mwh==TRUE) {
    result = result * 1000
  }
  
  # Output the result as a string with a comma for large numbers
  formatC(result, format="d", big.mark=",")
}

################################################################################
# Generation share by fuel type, year, and region
#
# Attributes
#   - region: ACEP region (string), of ["Coastal","Railbelt","Rural Remote"]
#   - year: Calendar year of interest (integer), of [2011:2021]
#   - fuel: Fuel code of interest (string), of ["Coal","Oil","Gas","Hydro","Wind","Solar"]
#   - decimals: Number of decimals for rounding (integer), default=0
################################################################################
##
#

generation_share <- function(region, year, fuel, decimals=0) {
  
  # Dataframe declaration
  df = regional_generation_mix
  
  # Generation share by options
  result = df[["gen_share"]][df$acep_region == region & df$fuel_type == fuel & df$year == year]
  
  # Output the rounded generation share to the specified decimal place as a string
  formatC(round(result, decimals), format="g") 
}
