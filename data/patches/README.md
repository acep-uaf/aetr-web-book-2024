# Data Patching Process

Data patches are intuitive way to fix errors with the data that are identified after the report is live. This allows us to react to inconsistencies that slip under the radar. The general process of a data patch is:

1.  Create a new folder under `data/patches` that corresponds to the numerical order that you want the patch applied (more on this below). 1.1. Create a `README.md` that provides detailed data on how the error was identified, how you validated the new data, and any notable differences. 1.2. Create a `*.R` script that applies the data patch. This script should be as environment agnostic as possible and should reference the raw dataframes as if they are *already* loaded into memory. 1.3. Include supplementary information such as new data and sources to the where the data was found. We are striving for maximum transparency here.
2.  Successfully run `data/main.R` **before pushing any changes**. This script loads the raw data into memory, applies patches, applies transformations, and then saves new versions of the final data in `data/final_data`.

# Patch Naming Conventions

-   Patches are applied following alphanumerical order using the following naming convention: `data/patches/patch_XXX`.
-   Patches can be placed in front of others by being clever with the number at the end of the patch folder (e.g., to make a new patch come before `patch_001`, name it `patch_0005` or something like that).
-   This same alphanumeric order placement applies to scripts in the data patch folder. If you want multiple scripts to run in a data patch folder, use numbers to make one come before the other (e.g., `00_me_first.R`, `01_me_second.R`,..., etc.)
    -   `data/patches/apply_patches.R` only looks for `*.R` in each patch folder so this is important.

# Example

Please see `data/patches/patch_001` for an example of a proper data patch.
