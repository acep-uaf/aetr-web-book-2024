# Patch 003

# Problem Statement

There is a considerable jump in natural gas generation for the rural remote region after 2013. If this is a missing data issue, it misrepresents the data.

# Investigation

After Patch 002, we are aware of issues with who got included in the 2011-13 data and who did not. This correlates to large difference in how much natural gas generation occurs in the rural and remote region.

The version of the net generation data (up to 002) notes the following yearly natural gas generation in the Rural Remote region:

| Year | ACEP Region  | Fuel Type | Net Generation (MWh) |
|------|--------------|-----------|----------------------|
| 2011 | Rural Remote | Gas       | 51686.0              |
| 2012 | Rural Remote | Gas       | 50997.0              |
| 2013 | Rural Remote | Gas       | 54914.0              |
| 2014 | Rural Remote | Gas       | 130548.04            |
| 2015 | Rural Remote | Gas       | 137082.16            |
| 2016 | Rural Remote | Gas       | 128797.94            |
| 2017 | Rural Remote | Gas       | 120107.31            |
| 2018 | Rural Remote | Gas       | 114633.35            |
| 2019 | Rural Remote | Gas       | 109041.82            |
| 2020 | Rural Remote | Gas       | 110443.42            |
| 2021 | Rural Remote | Gas       | 101314.98            |

The jump in generation after 2013 is quite obvious.

A set analysis showed that the there are three gas generators that appear in 2014-21 data that do not appear in 2011-13:

| EIA Plant Name      | EIA Utility ID | EIA Plant ID |
|---------------------|----------------|--------------|
| NSB Nuiqsut Utility | 26616          | 7484         |
| TNSG North Plant    | 57494          | 58278        |
| TNSG South Plant    | 57494          | 58117        |

After querying EIA-923 (and then annualizing) via PUDL, the following 2011-2013 data was found for the above generators:

| Year | EIA Plant Name      | EIA Utility ID | EIA Plant ID | Natural Gas, Net Generation (MWh) | Oil, Net Generation (MWh) |
|------|---------------------|----------------|--------------|-----------------------------------|---------------------------|
| 2011 | NSB Nuiqsut Utility | 26616          | 7484         | 1475.46                           | 1753.54                   |
| 2012 | NSB Nuiqsut Utility | 26616          | 7484         | 1416.82                           | 2047.18                   |
| 2012 | TNSG North Plant    | 57494          | 58278        | 35559.0                           |                           |
| 2012 | TNSG South Plant    | 57494          | 58117        | 35559.0                           |                           |
| 2013 | NSB Nuiqsut Utility | 26616          | 7484         | 4688.14                           | 1235.85                   |
| 2013 | TNSG North Plant    | 57494          | 58278        | 60500.0                           |                           |
| 2013 | TNSG South Plant    | 57494          | 58117        | 10677.0                           |                           |

All of these plants are actually both natural gas and oil generators. However, it appears only NSB Nuiqsut reported using oil for generation. Additionally, I have learned from RCA filings (TDX North Slope Generating, Inc CPCN 227) that oil and natural gas generation occured at generating units ("CT1 and CT2") for 2011. However, I could not find any sources that broke out generation by plant id's or names:

| Month | Year | Station Service (kWh) | Diesel Generation (kWh) | Gas Generation (kWh) | Net Generation (MWh) |
|-------|------|-----------------------|-------------------------|----------------------|----------------------|
| 1     | 2011 | 38747                 | 83520                   | 6639679              | 6684452              |
| 2     | 2011 | 41018                 | 25040                   | 6035536              | 6019558              |
| 3     | 2011 | 34352                 | 5190                    | 5681835              | 5652673              |
| 4     | 2011 | 33285                 | 0                       | 5830045              | 5796760              |
| 5     | 2011 | 37664                 | 0                       | 4712288              | 4674624              |
| 6     | 2011 | 54572                 | 69601                   | 3540311              | 3555340              |
| 7     | 2011 | 52741                 | 0                       | 3313214              | 3260473              |
| 8     | 2011 | 40368                 | 52                      | 3573910              | 3533594              |
| 9     | 2011 | 40625                 | 0                       | 4078548              | 4037923              |
| 10    | 2011 | 46035                 | 0                       | 4810206              | 4764171              |
| 11    | 2011 | 42381                 | 0                       | 6028680              | 5986299              |
| 12    | 2011 | 51245                 | 0                       | 6644558              | 6593313              |

It should also be noted that in 2012 EIA-923 data, the net generation statistics are exactly equal between the north and south plant. There is definitely some odd data here, but that is at the federal level.

# Solution

I propose the following two-stage solution,

1. Row insert "NSB Nuiqsut Utility" plant data for years 2011-2013 (+7580.42 MWh of natural gas, +5036.57 MWh of oil)
2. Row insert "TNSG North Plant" and "TNSG North Plant" plant data for years 2012-13 (+142295 MWh of natural gas)
3. Row insert a new plant "TDC CT1/CT2" for 2011 (+60377.32 MWh of natural gas, +181.86 MWh of oil)
    - These net generation statistics were found by taking total generation statistics for natural gas and oil, and calculating the share of total by each fuel (99.7% natural gas, 0.03% oil). With these shares, I estimated the station service associated with fuel type by multiplying it by this share. This created net generation estimates for each fuel.

The final additions are as follows,

| Year | EIA Plant Name      | EIA Utility ID | EIA Plant ID | Gas, Net Generation (MWh) | Oil, Net Generation (MWh) |
|------|---------------------|----------------|--------------|---------------------------|---------------------------|
| 2011 | NSB Nuiqsut Utility | 26616          | 7484         | 1475.46                   | 1753.54                   |
| 2011 | TDX CT1/CT2         | 57494          |              | 60377.31766               | 181.8623355               |
| 2012 | NSB Nuiqsut Utility | 26616          | 7484         | 1416.82                   | 2047.18                   |
| 2012 | TNSG North Plant    | 57494          | 58278        | 35559                     |                           |
| 2012 | TNSG South Plant    | 57494          | 58117        | 35559                     |                           |
| 2013 | NSB Nuiqsut Utility | 26616          | 7484         | 4688.14                   | 1235.85                   |
| 2013 | TNSG North Plant    | 57494          | 58278        | 60500                     |                           |
| 2013 | TNSG South Plant    | 57494          | 58117        | 10677                     |                           |

Links for sources on the RCA data for the TDX CT1/CT2 entry are found in `tdx_net_genertaion_2011.csv`. Other data found via EIA-923 are included in `rural_remote_missing.csv`.