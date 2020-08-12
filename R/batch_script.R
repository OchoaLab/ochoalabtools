# internal function, identifies existing batch files (addding extension if needed)
# dies if nothing was found
batch_script <- function(
                         name
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

    return( file )
}
