# Identify all data patches
patches <- list.dirs(
    path = "./data/patches",
    full.names=TRUE,
    recursive=FALSE
  )

# Apply data patches to raw data
for(i in patches) {
  payload <- list.files(path = i, full.names=TRUE, pattern = "*.R")
  source(payload)
}