#' Maximum figure heights for several journals
#'
#' Returns maximum height values in inches (~ 8.7) for figures according to various journal specifications.
#' Typically there is no minimum.
#'
#' @param journal String specifying journal of interest
#'
#' @examples
#' fig_height('plos')
#'
#' @seealso
#' [fig_width()]
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
fig_height <- function(
                       journal = c('plos', 'pnas')
                       ) {
    journal <- match.arg( journal )
    switch(
        journal,
        plos = 8.75,
        pnas = measurements::conv_unit( 22, "cm", "inch" ) # 8.661417
    )
    ## ## genetics dimensions
    ## ## height max 25cm =
    ## heightMax <- 9.84252
}

