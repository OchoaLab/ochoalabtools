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
            h <- fig_height( journal )
        )
        expect_true( is.numeric( h ) )
        expect_equal( length( h ), 1 )
        expect_true( !is.na( h ) )
        expect_true( h >= 0 )
        expect_true( h <= 11 ) # never bigger than standard page size
    }
})

test_that("fig_scale works", {
    # repeat for several combinations of parameters
    for ( journal in c( 'plos', 'pnas' ) ) {
        for ( ratio in c( 3/4, 1, 4/3 ) ) {
            expect_silent(
                wh <- fig_scale( ratio, journal )
            )
            # test that overall return value is as expected
            expect_true( is.numeric( wh ) )
            expect_equal( length( wh ), 2 )
            expect_true( !anyNA( wh ) )
            expect_true( all( wh >= 0 ) )
            # extract values
            w <- wh[ 1 ]
            h <- wh[ 2 ]
            # check that they each are as expected
            expect_true( w <= 8.5 ) # never bigger than standard page size
            expect_true( h <= 11 ) # never bigger than standard page size
            # expected ratio
            expect_equal( w/h, ratio )
            # tighter bounds given by journal
            expect_true( w <= fig_width( journal ) )
            expect_true( h <= fig_height( journal ) )
        }
    }
})
