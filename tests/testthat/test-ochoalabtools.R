test_that("fig_width works", {
    # repeat for several combinations of parameters
    for ( journal in c( 'plos', 'pnas' ) ) {
        # skipping "mid", which can be NA, don't expect it to fail if the others worked, and is rare option
        for ( size in c( 'max', 'min' ) ) {
            expect_silent(
                w <- fig_width( journal, size )
            )
            expect_true( is.numeric( w ) )
            expect_equal( length( w ), 1 )
            expect_true( !is.na( w ) )
            expect_true( w >= 0 )
            expect_true( w <= 8.5 ) # never bigger than standard page size
        }
    }
})

test_that("fig_height works", {
    # repeat for several combinations of parameters
    for ( journal in c( 'plos', 'pnas' ) ) {
        expect_silent(
            w <- fig_height( journal )
        )
        expect_true( is.numeric( w ) )
        expect_equal( length( w ), 1 )
        expect_true( !is.na( w ) )
        expect_true( w >= 0 )
        expect_true( w <= 11 ) # never bigger than standard page size
    }
})

