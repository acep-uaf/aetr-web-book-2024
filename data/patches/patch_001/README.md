Patch 001

# Objective

This patch adds in missing net generation statistics for the Southcentral Power Project.

# Background

Subject matter experts (SMEs) at ACEP noticed that the net generation graphs were systematically low for 2013-2020. After further investigation, they learned that the Southcentral Power Project (SPP) was only reporting approximately 70% of the actual net generation for the plant. This is a reporting error by the operator of the plant, who is supposed to file total net generation for the entire plant on this form, but instead reported only the net generation from the plant that the operator actually received as part of their ownership share.

# Investigation

ACEP SMEs and data scientists used a variety of federal and state reporting forms to identify the missing net generation from SPP. We know that FERC Form No. 1 (FERC1) asks reporting utilities to identify the net generation they receive from each power plant in their asset pool, which provides an accurate view into each utility's total net generation. We also know that SPP had two owners from 2013 to 2020: Chugach Electric Association, Inc. (70% ownership) and Anchorage Municipal Light and Power (30% ownership) - herein MLP.

Since the net generation data used in this trends report is from EIA-923, we would expect that the net generation for SPP reported there to be equal to the sum of each owner's net generation from SPP as reported on FERC1.[^readme-1] Below is a table showing annualized statistics from EIA-923 as they compare to those reported in FERC1 for both owners of SPP:

[^readme-1]: We confirmed with the Energy Information Administration (EIA) that it is valid to assume that the operator submitting EIA-923 should be submitting the entire net generation statistics for the generating units (Email Communication with EIA, 2024).

**Reporting Differences for Southcentral Power Project, Net Generation (MWh)**

| Report Year | EIA-923    | Chugach FERC1 | MLP FERC1  | Total FERC 1 | Difference (EIA923 - FERC1) |
|-------------|------------|---------------|------------|--------------|-----------------------------|
| 2013        | 905129.1   | 905129.1      | 376802     | 1281931.1    | -376802                     |
| 2014        | 909387.839 | 909387.839    | 392146     | 1301533.84   | -392146                     |
| 2015        | 867949.78  | 867949.78     | 338331     | 1206280.78   | -338331                     |
| 2016        | 873590.39  | 873590.39     | 373982     | 1247572.39   | -373982                     |
| 2017        | 866012.8   | 866012.8      | 372998     | 1239010.8    | -372998                     |
| 2018        | 819405.99  | 819405.99     | 389111     | 1208516.99   | -389111                     |
| 2019        | 797907.6   | 797907.6      | 386258.472 | 1184166.07   | -386258.472                 |
| 2020        | 822673     | 1125773.9     | 0          | 1125773.9    | -303100.9                   |
| 2021        | 1041694    | 1042049.3     | 0          | 1042049.3    | -355.3                      |

**Notes:** EIA-923 was summed to create annual representations of the data. SPP was not commissioned until 2013. MLP did not report a FERC1 in 2020 because they were merged with Chugach.

# Results

We isolated the missing MLP SPP net generation data by examining FERC1 filings submitted in the annual reports to the Regulatory Commission of Alaska. We identified approximately 3 GWh of missing net generation data from 2013-2019. Additionally, we found that the 2020 EIA-923 data was also misreported. This is evident in the difference between Chugach's FERC1 and EIA-923 filings for that specific year.

# Solution

Given that the data presented in this trends report, and that which is available for download, is at the yearly time step, we have added the MLP SPP net generation data from FERC1 to the dataset. Additionally, we have replaced the EIA-923 SPP net generation data for 2020 with that which is reported by Chugach's FERC1. The code highlighting this change can be found in `patch_001/01_spp_generation.R`.

After the data was patched, the project was rebuilt to incorporate the new data.

# Appendix

Several sources of data were considered for this project. Originally, we attempted to use RCA Cost of Power Adjustment (COPA) filings to determine MLP's SPP net generation share. While we were successful at obtaining monthly net generation data for this, the annual totals of this data significantly deviate from what MLP reports on FERC1. This is expected as the generation reports are non-final in RCA filings and can be changed/amended as more accurate information arise. However, this was rarely done in practice. Regardless, we present the MLP's SPP net generation data from RCA COPA filings in `patch_001/mlp_spp_rca_copa_data.csv`. The FERC1 data that we use in this patch is also found in `patch_001/spp_ferc_data.csv`. Both files include links to the direct source they were found.

# Contract Information

The point of contact for this patch is: Jesse Kaczmarski, [jikaczmarski\@alaska.edu](mailto:jikaczmarski@alaska.edu)
