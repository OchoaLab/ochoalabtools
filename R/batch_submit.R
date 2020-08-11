#' Submit an existing batch job file
#'
#' Given an existing sbatch job file, this script calls `sbatch` with parameters and gets job submitted.
#' Ideal to simplify big loops.
#'
#' @param name Either the full batch job file path, or its base name (excluding the extension `.q`).
#' Must exist.
#' @param partition The partition to submit to, by default `biostat`.
#'
#' @examples
#'
#' # set desired parameters
#' commands <- 'time echo "Hello world!"'
#' name <- 'hola'
#' mem <- '1G'
#' 
#' # writes file `hola.q`
#' batch_writer(
#'     commands,
#'     name,
#'     mem
#' )
#'
#' # this submits `hola.q` to `biostat` partition:
#' batch_submit( 'hola' )
#'
#' # cleanup
#' file.remove( paste0( name, '.q' ) )
#' 
#' @seealso
#' `\link{batch_writer}` to write these batch files
#' 
#' @export
batch_submit <- function(
                         name,
                         partition = 'biostat'
                         ) {
    # make sure nothing important is missing
    if ( missing( name ) )
        stop('`name` is required!')

    # batch file must already exist
    # make sure it does exist, potentially with missing extension
    if ( file.exists( name ) ) {
        file <- name
    } else {
        file <- paste0( name, '.q' )
        if ( !file.exists( file ) )
            stop( 'neither `name` nor `name`.q are existing files!' )
    }
    
    # submit job!
    system2(
        'sbatch',
        args = c(
            '-p', partition,
            file
        )
    )
}
