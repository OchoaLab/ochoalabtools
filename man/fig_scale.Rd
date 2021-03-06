% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fig_scale.R
\name{fig_scale}
\alias{fig_scale}
\title{Scale dimensions to fit maximum space available given desired aspect ratio}
\usage{
fig_scale(ratio, journal = c("plos", "pnas"))
}
\arguments{
\item{ratio}{The desired figure aspect ratio, as width/height.}

\item{journal}{String specifying journal of interest.}
}
\value{
The length-2 vector with final width and height, in that order.
}
\description{
For simplicity, the maximum dimensions are specified by journal.
}
\examples{
fig_scale( 1, 'plos' )

}
\seealso{
\code{\link[=fig_width]{fig_width()}}, \code{\link[=fig_height]{fig_height()}}.
}
