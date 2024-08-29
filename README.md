# AETR Web Book

Preliminary Alaska Electricity Trends Report as a web book.

## Preview and Render Locally

### Prepare the environment

Rendering this web-book requires R (>=4.4.0) and some R packages.

1. Install R from [The Comprehensive R Archive Network](https://cran.r-project.org) using the correct method for your operating system.

2. Install OpenSSL, which is required for one of the packages. 

3. The [Barlow font (Regular and Bold)](https://github.com/google/fonts/blob/main/ofl/barlow/) must be installed on your machine. This will be different for different operating systems.
  
   1. For Macs, follow the instructions for [installing fonts via Font Book](https://support.apple.com/guide/font-book/install-and-validate-fonts-fntbk1000/mac)

   2. For Linux, manually perform the commands listed in this project's [GitHub Workflow](https://github.com/eldobbins/aetr-web-book-2024/blob/b3c9762e4528243bef33a7e09d1e52dabc206602/.github/workflows/quarto-publish.yml#L51)

4. Issue these commands on your command line (or however you access R) to prepare your R environment using `renv`:

  ``` bash
  % cd aetr-web-book-2024/
  % R    # at the command line to start R
  > renv::restore()
  ```

### Previewing Locally

[Web book Previewing](https://quarto.org/docs/websites/#website-preview) describes viewing the website locally by using `quarto preview` on the command line to generate HTML from the `qmd` files. The generated HTML code goes in the `_book/` directory. It should also automatically open a browser window. See `quarto preview help` for hints.

However, we use [Profiles](https://github.com/acep-uaf/aetr-web-book-2024/wiki/Quarto-Profiles) in this repository with three different configuration files which complicates local previewing somewhat.

1. `_quarto.yml` = the main configuration file that triggers the other two
2. `_quarto-html.yml` = configures the web book
3. `_quarto-pdf.yml` = configures the PDF report

If the default profile is not set in `_quarto.yml`, the `quarto preview` renders both, one after the other; however the second render clobbers the first so you can only view HTML or PDF depending on the order of the profile group. So in our case, it is better to specify which format you want to render with `quarto preview --profile html` or `quarto preview --profile pdf`, or to toggle `default` between the two by editing `_quarto.yml`.

VSCode and RStudio both render and preview pages automatically using a `Preview` button. In VSCode, open a `.qmd` page in the editor such as `index.qmd`, and hit shift-command-K to preview the page.

## Publishing via GitHub

This project includes a [GitHub Workflow](https://github.com/eldobbins/aetr-web-book-2024/blob/b3c9762e4528243bef33a7e09d1e52dabc206602/.github/workflows/quarto-publish.yml) that renders the Markdown as HTML and PDF and posts those to the `gh-pages` branch to create a website.  You can see in that workflow that the two profiles are rendered sequentially with the PDF subsequently copied into the `gh-pages` branch to avoid the clobbering issue noted locally.

Note that rendered files and directories containing rendered files should be listed in `.gitignore` so they don't get copied into the GitHub repo. The presence of those files causes GitHub Actions to choke which breaks the generation and posting of the web book.

## Credits

Website format is based on the [Quarto Website Tutorial](https://openscapes.github.io/quarto-website-tutorial/) developed by [Openscapes](https://openscapes.org/). Code is avalable in the [tutorial GitHub repo](https://github.com/Openscapes/quarto-website-tutorial/tree/main).

This project was created using the [cookiecutter-quarto-website](https://github.com/eldobbins/cookiecutter-quarto-website) template that utilizes the [Cookiecutter](https://cookiecutter.readthedocs.io/en/stable/README.html) project, but has many extensions not included in that template.
