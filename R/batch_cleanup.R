#' Delete an existing slurm batch script
#'
#' This convenient function deletes a batch script without having to provide the extension.
#' Good practice after large submissions.
#'
#' @param name Either the full batch job file path, or its base name (excluding the extension `.q`).
#' Must exist.
#'
#' @examples
#'
#' # set desired parameters
#' commands <- 'time echo "Hello world!"'
#' name <- 'hola'
#' 
#' # writes file `hola.q`
#' batch_writer(
#'     commands,
#'     name
#' )
#'
#' # cleanup
#' batch_cleanup( name )
#' 
#' @seealso
#' [batch_writer()] to write slurm batch scripts.
#' [batch_submit()] to submit slurm batch scripts.
#' 
#' @export
batch_cleanup <- function( name ) {
    # make sure nothing important is missing
    if ( missing( name ) )
        stop('`name` is required!')

    # finds existing files (adds extension if needed), dies if non-existent
    file <- batch_script( name )

    # delete file now!
    # invisible prevents printing [1] upon success
    invisible( file.remove( file ) )
}
