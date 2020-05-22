
# ochoalabtools

The goal of `ochoalabtools` is to package some handy wrappers to common tasks with better defaults, to reduce typing.
The focus is on plotting for scientific publications, but a few other random functions are also available.
Mainly for personal use and/or within the lab.

## Installation

This package is only available on GitHub, and can be installed this way:
```R
install.packages("devtools") # if needed
library(devtools)
install_github("OchoaLab/ochoalabtools")
```

## Example

``` r
library(ochoalabtools)

# get arguments from the command line, the way you'd get them in other programming languages
args <- args_cli()

# here's a wide figure with two panels, with panel letters
# start a figure
fig_start(
    'example', # starts example.pdf
    width = 6, # wide fig (default is width = height = 3 inches)
    mar_t = 2 # increase top margin (default is zero top margin)
)
# create a two-panel figure
par( mfrow = c(1, 2) )
# plot things as usual (first panel)
plot(1:10, main = 'first panel')
# add a panel letter
panel_letter('A')
# second panel
plot(10:1, main = 'second panel')
panel_letter('B')
# close PDF output
fig_end()

```
