context("igraphConversion works")
data(flightGraph)
prepped <- prepIgraphConversion(flightGraph)

test_that('prepIgraphConversion returns a two element list', {
    expect_is(prepped, 'list')
    expect_equal(length(prepped), 2)
})

test_that('prepIgraphConversion returns two data.frames of the proper sizes', {
    expect_is(prepped$nodes, 'data.frame')
    expect_is(prepped$edges, 'data.frame')
    
    expect_equal(nrow(prepped$nodes), igraph::vcount(flightGraph))
    expect_equal(nrow(prepped$edges), igraph::ecount(flightGraph))
    
    expect_equal(ncol(prepped$nodes), length(igraph::vertex.attributes(flightGraph)) + 1)
    expect_equal(ncol(prepped$edges), length(igraph::edge.attributes(flightGraph)) + 3)
})
