#' Submit an existing slurm batch script
#'
#' Given an existing batch script, this script calls `sbatch` with parameters and gets job submitted.
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
#' batch_cleanup( name )
#' 
#' @seealso
#' `\link{batch_writer}` to write slurm batch scripts.
#' `\link{batch_cleanup}` to remove slurm batch scripts.
#' 
#' @export
batch_submit <- function(
                         name,
                         partition = 'biostat'
                         ) {
    # make sure nothing important is missing
    if ( missing( name ) )
        stop('`name` is required!')

    # finds existing files (adds extension if needed), dies if non-existent
    file <- batch_script( name )

    # submit job!
    system2(
        'sbatch',
        args = c(
            '-p', partition,
            file
        )
    )
}
