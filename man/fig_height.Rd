% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fig_height.R
\name{fig_height}
\alias{fig_height}
\title{Maximum figure heights for several journals}
\usage{
fig_height(journal = c("plos", "pnas"))
}
\arguments{
\item{journal}{String specifying journal of interest.}
}
\value{
The maximum height, in inches.
}
\description{
Returns maximum height values in inches (~ 8.7) for figures according to various journal specifications.
Typically there is no minimum.
}
\examples{
fig_height('plos')

}
\seealso{
\code{\link[=fig_width]{fig_width()}}

PLoS Genetics reference:
\url{https://journals.plos.org/plosgenetics/s/figures}

PNAS reference:
\url{https://www.pnas.org/authors/submitting-your-manuscript#manuscript-formatting-guidelines}

Journals that don't specify limits:

Genetics reference:
\url{https://www.genetics.org/content/prep-manuscript#figures}

Nature Genetics reference:
\url{https://www.nature.com/ng/for-authors/preparing-your-submission#formatting}
}
