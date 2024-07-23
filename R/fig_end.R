#' Ends a PDF or PNG figure
#'
#' `fig_end` closes the PDF or PNG device created by [fig_start()].
#' It's simply a wrapper to [grDevices::dev.off()] that returns invisibly and saves typing.
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
