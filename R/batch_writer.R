#' Write a slurm batch script file
#'
#' A wrapper around writing the script given the desired command, a short name for the job, and many optional parameters.
#' Defaults are for my current setup (latest R version on cluster).
#'
#' @param commands A character vector of commands to run, one per line.
#' @param name Short name for for batch script file, job, and stdout/stderr output paths
#' @param R Specify R version, to load module (`NA` prevents loading R).
#' @param mem Memory limit.
#' `NA` (default) is no memory limit.
#' May be a string like `1G`, whatever sbatch accepts.
#' @param time Time limit.
#' `NA` (default) is no time limit.
#' May be a string like `1:00:00`, whatever sbatch accepts.
#' @param nodes Number of nodes to use (default 1).
#' @param threads Number of tasks per node (default 1).
#' @param array Value for array jobs (default NA is not an array job; typical values are numeric ranges passed as strings, such as "1-50", "0-90", or discontinuous ranges such as "1,4,10-20").
#' @param partition The partition to submit to, by default `biostat`.
#' If `NA` then no partition is declared (default partition will be used, `common` in DCC?).
#' @param account Account to use.
#' `NA` (default) is default account for user.
#' @param email Address to receive emails about job completion.
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
#' [batch_submit()] to submit slurm batch scripts.
#' [batch_cleanup()] to remove slurm batch scripts.
#'
#' @export
batch_writer <- function(
                         commands,
                         name,
                         R = '4.0.0',
                         mem = NA,
                         time = NA,
                         nodes = 1,
                         threads = 1,
                         array = NA,
                         partition = 'biostat',
                         account = NA,
                         email = NA
                         ) {
    # make sure nothing important is missing
    if ( missing( commands ) )
        stop('`commands` is required!')
    if ( missing( name ) )
        stop('`name` is required!')

    # wrap commands with load/unload R (common option!)
    if ( !is.na( R ) ) {
        commands <- c(
            paste0( 'module load R/', R ),
            commands,
            paste0( 'module unload R/', R )
        )
    }

    # add repetitive/structured sbatch header lines
    # these are always present
    header <- c(
        '#!/bin/bash',
        paste0( '#SBATCH --job-name=', name ),
        paste0( '#SBATCH --output=', name, '.out' )
        ## paste0( '#SBATCH --error=', name, '.stderr' )
    )
    
    # add email info if provided
    if ( !is.na( email ) )
        header <- c(
            header,
            paste0( '#SBATCH --mail-user=', email ),
            '#SBATCH --mail-type=END,FAIL'
        )
    
    # add memory limit if provided
    if ( !is.na( mem ) )
        header <- c(
            header,
            paste0( '#SBATCH --mem=', mem )
        )
        
    # add time limit if provided
    if ( !is.na( time ) )
        header <- c(
            header,
            paste0( '#SBATCH --time=', time )
        )

    # add array values if provided
    if ( !is.na( array ) )
        header <- c(
            header,
            paste0( '#SBATCH --array=', array )
        )
    
    # add partition if provided
    if ( !is.na( partition ) )
        header <- c(
            header,
            paste0( '#SBATCH -p ', partition )
        )
    
    # add account if provided
    if ( !is.na( account ) )
        header <- c(
            header,
            paste0( '#SBATCH --account=', account )
        )
    
    # add nodes option if greater than 1
    if ( nodes > 1 )
        header <- c(
            header,
            paste0( '#SBATCH --nodes=', nodes )
        )

    # add "threads" if greater than 1
    if ( threads > 1 )
        header <- c(
            header,
            paste0( '#SBATCH --ntasks-per-node=', threads )
        )
    
    # merge header and commands
    commands <- c(
        header,
        commands
    )

    # batch file full path
    file <- paste0( name, '.q' )
    
    # write script to file
    readr::write_lines(
        x = commands,
        file = file
    )
}
