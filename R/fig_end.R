#' Ends a PDF figure
#'
#' `fig_end` closes the PDF device created by `fig_start`.
#' It's simply a wrapper to `\link[grDevices]{dev.off}` that returns invisibly and saves on typing.
#' 
#' @examples
#' # fig_start('my_plot')
#' # plot(1:10)
#' # fig_end()
#' 
#' @export
fig_end <- function() {
    invisible( grDevices::dev.off() )
}
