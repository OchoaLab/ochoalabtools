#' Write an sbatch job file
#'
#' A wrapper around writing the script given the desired command, a short name for the job, a memory limit, and many optional parameters.
#' Defaults are for my current setup (my email, latest R version on cluster).
#'
#' @param commands A character vector of commands to run, one per line.
#' @param name Short name for job, for queue file, and also for stdout/stderr output paths
#' @param mem Memory limit.
#' May be a string like `1G`, whatever sbatch accepts.
#' @param time Time limit.
#' `NA` (default) is no time limit.
#' May be a string like `1:00:00`, whatever sbatch accepts.
#' @param nodes Number of nodes to use (default 1).
#' @param threads Number of tasks per node (default 1).
#' @param R Specify R version, to load module (`NA` prevents loading R).
#' @param email Address to receive emails about job completion.
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
#' # cleanup
#' file.remove( paste0( name, '.q' ) )
#' 
#' @seealso
#' `\link{batch_submit}` to submit these batch files
#'
#' @export
batch_writer <- function(
                         commands,
                         name,
                         mem,
                         time = NA,
                         nodes = 1,
                         threads = 1,
                         R = '4.0.0',
                         email = 'alejandro.ochoa@duke.edu'
                         ) {
    # make sure nothing important is missing
    if ( missing( commands ) )
        stop('`commands` is required!')
    if ( missing( name ) )
        stop('`name` is required!')
    if ( missing( mem ) )
        stop('`mem` is required!')

    # wrap commands with load/unload R (common option!)
    if ( !is.na( R ) ) {
        commands <- c(
            paste0( 'module load R/', R ),
            commands,
            paste0( 'module unload R/', R )
        )
    }

    # add repetitive/structured sbatch header lines
    commands <- c(
        '#!/bin/bash',
        paste0( '#SBATCH --job-name=', name ),
        paste0( '#SBATCH --mail-user=', email ),
        '#SBATCH --mail-type=END,FAIL',
        paste0( '#SBATCH --mem=', mem ),
        if ( !is.na(time) ) paste0( '#SBATCH --time=', time ) else '',
        paste0( '#SBATCH --nodes=', nodes ),
        paste0( '#SBATCH --ntasks-per-node=', threads ),
        paste0( '#SBATCH --output=', name, '.stdout' ),
        paste0( '#SBATCH --error=', name, '.stderr' ),
        commands
    )

    # write to a file
    file <- paste0( name, '.q' )
    readr::write_lines(
        x = commands,
        path = file
    )
}
