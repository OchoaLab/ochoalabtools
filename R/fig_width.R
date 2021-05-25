#' Figure widths requirements for several journals
#'
#' Returns by default maximum width values in inches (~ 7-7.5) for figures according to various journal specifications.
#' It also optionally returns minimum (~ 2.6-3.5) and mid values (~ 4.3), for fractional column sizes, if defined.
#'
#' @param journal String specifying journal of interest
#' @param size Desired size range ("max" and "min" are always defined, "mid" is non-NA in some cases).
#'
#' @examples
#' fig_width('plos')
#'
#' @seealso
#' [fig_height()]
#' 
#' PLoS Genetics reference:
#' <https://journals.plos.org/plosgenetics/s/figures>
#'
#' PNAS reference:
#' <https://www.pnas.org/authors/submitting-your-manuscript#manuscript-formatting-guidelines>
#' 
#' Journals that don't specify limits:
#' 
#' Genetics reference:
#' <https://www.genetics.org/content/prep-manuscript#figures>
#'
#' Nature Genetics reference:
#' <https://www.nature.com/ng/for-authors/preparing-your-submission#formatting>
#' 
#' @export
fig_width <- function(
                      journal = c('plos', 'pnas'),
                      size = c('max', 'min', 'mid')
                      ) {
    journal <- match.arg( journal )
    size <- match.arg( size )
    switch(
        journal,
        plos = switch(
            size,
            max = 7.5,
            mid = NA,
            min = 2.63
        ),
        # these are given in cm, convert all outside
        pnas = measurements::conv_unit( 
                                 switch(
                                     size,
                                     max = 18, # 7.086614 in
                                     mid = 11, # 4.330709 in
                                     min = 9   # 3.543307 in
                                 ),
                                 "cm",
                                 "inch"
                             )
    )
    ## ## old PNAS versions (updated ones are above)
    ## widthPnas <- 3.42 # with of 1.0 column figure, in inches
    ## widthPnas2 <- 4.5 # with of 1.5 column figure, in inches
    ## widthPnas3 <- 7   # with of 2.0 column figure, in inches
    ## ## genetics dimensions
    ## ## width max 20cm =
    ## widthMax <- 7.87402
}
