# AETR Web Book

Preliminary Alaska Electricity Trends Report as a web book.

## Preview and Render Locally

### Prepare the environment

Rendering this web-book requires R (>=4.4.0) and some R packages.

1. Install R from [The Comprehensive R Archive Network](https://cran.r-project.org) using the correct method for your operating system.
2. Install OpenSSL, which is required for one of the packages.

3. Issue these commands on your command line (or however you access R) to prepare your R environment using `renv`:

  ``` bash
  % cd aetr-web-book-2024/
  % R    # at the command line to start R
  > renv::restore()
  ```

4. The Barlow font must be installed.  


### Previewing

[Web-book Previewing](https://quarto.org/docs/websites/#website-preview) allows viewing of the completed website by generating HTML from the `qmd` files.  To preview the web-book using commands in the terminal:

``` bash
# preview the web-book in the current directory
quarto preview
```

It should automatically open a browser window. See `quarto preview help` for hints

You can also render the web-book without displaying it. The generated code goes in the `_book` directory (which should be listed in .gitignore)

``` bash
# render the website in the current directory
quarto render 
```

VSCode and RStudio both render and preview pages automatically using a `Render` button. In VSCode, open a `.qmd` page in the editor such as `index.qmd`, and 

## Publishing via GitHub



## Credits

Website format is based on the [Quarto Website Tutorial](https://openscapes.github.io/quarto-website-tutorial/) developed by [Openscapes](https://openscapes.org/). Code is avalable in the [tutorial GitHub repo](https://github.com/Openscapes/quarto-website-tutorial/tree/main).

This project was created using the [cookiecutter-quarto-website](https://github.com/eldobbins/cookiecutter-quarto-website) template that utilizes the [Cookiecutter](https://cookiecutter.readthedocs.io/en/stable/README.html) project
