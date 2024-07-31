# Problem

There is a significant jump in reported net generation statistics for the coal fuel code in the Railbelt after 2013. This year to year differential stays relatively flat after 2015; indicating some potential for anomaly across the sample - particularly regarding missing reporters in the previous years.

# Investigation

The net generation data by fuel code comes from the Alaska Energy Stats Workbooks. Years 2011 through 2013 were developed by AEA/ISER. In these workbooks, the only coal generation reported in the state comes from two coal generating facilities in Fairbanks:

-   Aurora Energy, Aurora Energy LLC Chena
-   Healy, Golden Valley Electric Association, Inc.

After querying coal generating statistics using EIA-923 from 2011-21, I found that the following generators are included in years after 2013 but not before:

-   Eielson Air Force Base (EIA ID: 50392)
-   University of Alaska Fairbanks (EIA ID: 50711)
-   Doyon Utilities - Fort Wainwright (EIA ID: 50308)

This appears to have occurred because the 2011-13 workbooks developed by AEA/ISER only considered "certified utilities". Since the above coal generators are not certified utilities, they do not appear in the workbooks. This indicates a logic break in the data compiled after 2013 in terms of what qualifies.

# Solution

Given that these generators are present in 2014-21, it makes sense to add these generators retroactively to the dataset. This is completed with `patches/patch_002/01_railbelt_coal_generators.R`. As a result, the coal generation figures approximately double for years 2011-13. The data extracted from EIA-923 is also included in this patch in `patches/patch_002/railbelt_coal_generators_2011-13.csv`. This data was queried from EIA-923 (via PUDL) and then summed to the yearly level. These generators only report statistics for coal which is what I present here.
