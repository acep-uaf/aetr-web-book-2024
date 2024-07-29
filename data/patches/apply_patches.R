# Identify all data patches
## Create a list of all patches by folder name (alphanumeric order)
patches <- list.dirs(
    path = "./patches",
    full.names=TRUE,
    recursive=FALSE
  )

# Apply data patches to raw data
## For every identified patch folder,
for(patch_folder in patches) {
  ## Create a list of all scripts (alphanumeric order)
  patch_scripts <- list.files(path = patch_folder, full.names=TRUE, pattern = "*.R")
  
  ## For each script in the patch folder,
  for (script in patch_scripts) {
    ## Run the script
    source(script)
  }
}