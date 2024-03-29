% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/panel_letter.R
\name{panel_letter}
\alias{panel_letter}
\title{Add a large panel letter to the top left of the panel}
\usage{
panel_letter(letter, cex = 1.5, line = 0.5, adj = -0.1)
}
\arguments{
\item{letter}{The letter to display.
Mandatory, will stop if missing.}

\item{cex}{The character expansion factor (default 1.5 makes it larger than the ordinary title, to distinguish them clearly if also present).}

\item{line}{The margin line where the text is placed (default 0.5 matches the title line default in \code{\link[=fig_start]{fig_start()}}).}

\item{adj}{The text adjustment in the reading direction (default -0.1 is slightly to the left of the plotting area, over the left margin).
Might need to be adjusted depending on margins.

It is a copy of an internal function in \code{popkin}, where it is used by \code{plot_popkin} when there are multiple panels.}
}
\description{
This is a wrapper around \code{\link[graphics:mtext]{graphics::mtext()}} with useful default values for this setting.
See that function for more details.
Panel letters are placed as if they were titles (preserves \code{side = 3} hardcoded default).
}
\examples{
# create a plot area
plot(1:10)
# run this after the plot area has been created...
panel_letter('A')

}
