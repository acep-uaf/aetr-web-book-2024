# Introduction

This directory applies patches and transformations to the original data into versions for plotting, statistics, and distribution.

# Process

A GitHub action will trigger `main.R` if a change in the `data/patches` directory tree occurs. If a new patch is added to the `data/patches` directory (e.g., `data/patches/patch_001`), then `main.R` will load the original data into memory, apply all patches in the order they are numbered, apply transformations in `transformations/apply_transformations.R`, and then write new versions of the final data.
