#' Get arguments from the command line interface
#'
#' A simple wrapper around [commandArgs()] that sets `trailingOnly = TRUE`, reducing typing.
#'
#' @return A vector of command line arguments (as other programming languages would return them, unlike the crummy R default)
#'
#' @examples
#' args <- args_cli()
#'
#' @export
args_cli <- function() {
    args <- commandArgs( trailingOnly = TRUE )
}
