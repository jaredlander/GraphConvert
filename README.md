<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/jaredlander/GraphConvert.svg?branch=master)](https://travis-ci.org/jaredlander/GraphConvert)

GraphConvert
============

This is a collection of utilities for converting graphs amongst different types.

Converting Data to json
-----------------------

``` r
library(GraphConvert)
g <- igraph::graph('bull')
thisJson <- igraphToJson(g)
jsonlite::prettify(thisJson)
#> {
#>     "mode": [
#>         "NORMAL"
#>     ],
#>     "vertices": [
#>         {
#>             "label": "1",
#>             "id": 1
#>         },
#>         {
#>             "label": "2",
#>             "id": 2
#>         },
#>         {
#>             "label": "3",
#>             "id": 3
#>         },
#>         {
#>             "label": "4",
#>             "id": 4
#>         },
#>         {
#>             "label": "5",
#>             "id": 5
#>         }
#>     ],
#>     "edges": [
#>         {
#>             "id": 1,
#>             "source": 1,
#>             "target": 2
#>         },
#>         {
#>             "id": 2,
#>             "source": 1,
#>             "target": 3
#>         },
#>         {
#>             "id": 3,
#>             "source": 2,
#>             "target": 3
#>         },
#>         {
#>             "id": 4,
#>             "source": 2,
#>             "target": 4
#>         },
#>         {
#>             "id": 5,
#>             "source": 3,
#>             "target": 5
#>         }
#>     ]
#> }
#> 
```
