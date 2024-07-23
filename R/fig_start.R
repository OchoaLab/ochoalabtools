#' Starts a PDF or PNG figure with better defaults
#'
#' Creates a PDF or PNG figure with dimensions that default approximately to a single column on a two-column paper, bolds text, reduces space between labels and the figure, and sets other improved defaults for margins.
#' The goal is to create publication- and presentation-quality figures with few keystrokes.
#' PNG version is by default high resolution (600 ppi) and scales dimensions according to this resolution to get images that match their PDF counterparts as much as possible.
#'
#' @param name The output path, excluding extension (`.pdf` or `.png` is automatically added)
#' @param width Figure width, in inches (default 3).
#' If `png = TRUE`, this value gets multiplied by `png_res` to result in the final width in pixels.
#' @param height Figure height, in inches (default 3).
#' If `png = TRUE`, this value gets multiplied by `png_res` to result in the final height in pixels.
#' @param bg Figure background color (default "white")
#' @param mar_b Bottom margin size, in margin lines (default 3).
#' `mar_pad` gets added to this value to produce the final margins.
#' @param mar_l Left margin size, in margin lines (default 3).
#' `mar_pad` gets added to this value to produce the final margins.
#' @param mar_t Top margin size, in margin lines (default 0).
#' `mar_pad` gets added to this value to produce the final margins.
#' @param mar_r Right margin size, in margin lines (default 0).
#' `mar_pad` gets added to this value to produce the final margins.
#' @param mar A vector with four elements (in the format [graphics::par()] expects, as an alternative specification.
#' `mar_pad` gets added to this vector to produce the final margins.
#' The individual margins above are used if `mar = NULL` (default).
#' @param mar_pad Margin padding applied to all margins.
#' @param png If `TRUE`, output is a PNG file (default `FALSE` results in a PDF file).
#' @param png_res Resolution of PNG image in ppi.
#' In addition to setting the resolution internally in the file, this scales the `width`and `height` values (default in inches) to the final pixel values of the output.
#' Ignored if `png = FALSE`.
#' @param verbose If `TRUE` (default), prints a message indicating the path of the file that was created.
#'
#' The PDF or PNG is created via [grDevices::pdf()] or [grDevices::png()], respectively.
#' Fonts and lines are bolded by setting all of the following parameters to `2` via [graphics::par()]:
#' `font`, `font.main`, `font.sub`, `font.lab`, `font.axis`,  and `lwd`.
#' Similarly, titles and axis labels are placed closer to the figure by setting `mgp = c(2, 0.5, 0)`,
#' and the approximate number of tickmarks is reduced by setting `lab = c(3, 3, 7)`.
#'
#' @examples
#' ### simple square figure with nice margins
#' # fig_start('my_plot')
#' # plot(1:10)
#' # fig_end()
#'
#' ### example with a title
#' ### increase top margin only
#' # fig_start('my_plot', mar_t = 1.5)
#' # plot(1:10, main = 'My Title!')
#' # fig_end()
#' 
#' @export
fig_start <- function(
                      name,
                      width = 3,
                      height = 3,
                      bg = 'white',
                      mar_b = 3,
                      mar_l = 3,
                      mar_t = 0,
                      mar_r = 0,
                      mar = NULL,
                      mar_pad = 0.2,
                      png = FALSE,
                      png_res = 600,
                      verbose = TRUE
                      ){
    # create output file name
    file_out <- paste0( name, '.', if ( png ) 'png' else 'pdf' )
    # indicate which file was created, handy for immediate inspection
    if ( verbose ) 
        message( 'Writing: ', file_out )

    # create PDF
    if ( png ) {
        grDevices::png(
                       file_out,
                       width = width * png_res,
                       height = height * png_res,
                       bg = bg,
                       res = png_res
                   )
    } else {
        grDevices::pdf(
                       file_out,
                       width = width,
                       height = height,
                       bg = bg
                   )
    }
    
    # bold fonts and lines
    graphics::par(
        # overall text font type (like mtext or what?)
        font = 2,
        # titles specifically
        font.main = 2,
        # subtitles too (I never use them, but might as well)
        font.sub = 2,
        # axis labels
        font.lab = 2,
        # axis annotations
        font.axis = 2,
        # thicker line widths (overall)
        lwd = 2
    )

    # set margins
    # first construct final margin vector, unless it was provided
    if (is.null(mar))
        mar <- c(mar_b, mar_l, mar_t, mar_r)
    # now set margins, whatever they were
    graphics::par( mar = mar + mar_pad )

    # margin lines for title and axis labels
    # mpg[1] below puts title closer to figure than default
    # mpg[2] below puts axis labels closer to figure than default
    # mpg[3] axis line is unchanged
    # default is c(3, 1, 0)
    graphics::par( mgp = c(2, 0.5, 0) )

    # lab[1:2] below reduces the approximate numbers of tickmarks
    # lab[3] is unimplemented
    # default is c(5, 5, 7)
    graphics::par( lab = c(3, 3, 7) )
}
