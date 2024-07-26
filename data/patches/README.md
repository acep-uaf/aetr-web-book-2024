# Patching Conventions

Patches must follow a particular design to work correctly. Patches should be placed entirely in their own subfolder of this directory and be sequentially ordered (e.g., `patch_001/`, `patch_002/`, ..., etc.). Inside each patch directory should be,

1.  A markdown file detailing the patch
    1.  Please include a point of contact for the patch author or one who can answer questions about it.
2.  An R script that applies fixes to the original data
    1.  Design your script to work directly on the "wide-form" original data. This data is then transformed to long for distribution *after* the patching stage.
3.  Any supplemental material (e.g., new data, sources, etc.)

The names of files inside each patch do not matter. The patching script only looks for `*.R` in each patch folder.

# Multiple Files

If you want to have multiple R scripts in your patch, they must be named in an alphanumeric order consistent with when they should run:

```         
patch_00X/
  01_run_first.R
  02_run_second.R
  ...
  99_run_last.R
```
