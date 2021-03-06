% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/batch_cleanup.R
\name{batch_cleanup}
\alias{batch_cleanup}
\title{Delete an existing slurm batch script}
\usage{
batch_cleanup(name)
}
\arguments{
\item{name}{Either the full batch job file path, or its base name (excluding the extension \code{.q}).
Must exist.}
}
\description{
This convenient function deletes a batch script without having to provide the extension.
Good practice after large submissions.
}
\examples{

# set desired parameters
commands <- 'time echo "Hello world!"'
name <- 'hola'

# writes file `hola.q`
batch_writer(
    commands,
    name
)

# cleanup
batch_cleanup( name )

}
\seealso{
\code{\link[=batch_writer]{batch_writer()}} to write slurm batch scripts.
\code{\link[=batch_submit]{batch_submit()}} to submit slurm batch scripts.
}
