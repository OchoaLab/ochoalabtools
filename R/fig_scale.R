#' Scale dimensions to fit maximum space available given desired aspect ratio
#'
#' For simplicity, the maximum dimensions are specified by journal.
#'
#' @param journal String specifying journal of interest.
#' @param ratio The desired figure aspect ratio, as width/height.
#'
#' @return The length-2 vector with final width and height, in that order.
#'
#' @examples
#' fig_scale( 1, 'plos' )
#'
#' @seealso
#' [fig_width()], [fig_height()].
#'
#' @export
fig_scale <- function(
                      ratio,
                      journal = c('plos', 'pnas')
                      ) {
    # require values
    if ( missing( ratio ) )
        stop( '`ratio` is required!' )
    journal <- match.arg( journal )

    # get max dimensions for this journal
    width_max <- fig_width( journal )
    height_max <- fig_height( journal )
    # calculate ratio of these max dimensions (it's not a maximum ratio, bad name but meh)
    ratio_max <- width_max / height_max
    
    # now figure out which dimension to make shorter so things fit
    if ( ratio_max > ratio ) {
        # in this case
        # width_max / height_max > width / height
        # width_max * height > width * height_max
        # so height is limiting
        # return this
        height <- height_max
        width <- height_max * ratio
    } else {
        # here width is limiting
        width <- width_max
        height <- width_max / ratio
    }
    return( c( width, height ) )
}
