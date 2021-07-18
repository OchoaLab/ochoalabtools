#' Add a large panel letter to the top left of the panel
#'
#' This is a wrapper around [graphics::mtext()] with useful default values for this setting.
#' See that function for more details.
#' Panel letters are placed as if they were titles (preserves `side = 3` hardcoded default).
#'
#' @param letter The letter to display.
#' Mandatory, will stop if missing.
#' @param cex The character expansion factor (default 1.5 makes it larger than the ordinary title, to distinguish them clearly if also present).
#' @param line The margin line where the text is placed (default 0.5 matches the title line default in [fig_start()]).
#' @param adj The text adjustment in the reading direction (default -0.1 is slightly to the left of the plotting area, over the left margin).
#' Might need to be adjusted depending on margins.
#'
#' It is a copy of an internal function in `popkin`, where it is used by `plot_popkin` when there are multiple panels.
#'
#' @examples
#' # create a plot area
#' plot(1:10)
#' # run this after the plot area has been created...
#' panel_letter('A')
#' 
#' @export
panel_letter <- function(letter, cex = 1.5, line = 0.5, adj = -0.1) {
    # letter is the only thing that is required
    if ( missing( letter ) )
        stop('`letter` is required!')

    # actually plot letter
    graphics::mtext(
                  letter,
                  cex = cex,
                  line = line,
                  adj = adj
              )
}
