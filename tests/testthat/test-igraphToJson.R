context("igraphToJson works")
data(flightGraph)
thisJson <- igraphToJson(flightGraph)

test_that('igraphToJson returns a json object', {
    expect_is(thisJson, 'json')
    expect_equal(length(thisJson), 1)
})
