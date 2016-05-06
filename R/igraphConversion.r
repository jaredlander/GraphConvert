#' @title prepIgraphConversion
#' @description Prepares a graph for storing in standard format
#' @details Breaks an igraph into a list holding a nodes data.frames and an edges data.frame.  The nodes data.frame has at minimum an id and label column plus any other node attributes.  The edges data.frame has at minimum an id, source and target columns plus any edge attributes.
#' @author Jared P. Lander
#' @aliases prepIgraphConversion
#' @export prepIgraphConversion
#' @importFrom magrittr "%<>%" "%>%"
#' @importFrom dplyr mutate n rename select mutate_ rename_
#' @param g An igraph object
#' @return A list holding a nodes data.frames and an edges data.frame.  The nodes data.frame has at minimum an id and label column plus any other node attributes.  The edges data.frame has at minimum an id, source and target columns plus any edge attributes.
#' @examples 
#' 
#' data(flightGraph)
#' prepIgraphConversion(flightGraph)
prepIgraphConversion <- function(g)
{
    # first make sure the nodes have names
    if(is.null(igraph::V(g)$name))
    {
        igraph::V(g)$name <- as.character(igraph::V(g))
    }
    
    # make graph into a list of data.frames
    gdata <- igraph::get.data.frame(g, what = "both")
    
    # rename vertices to nodes
    names(gdata)[1] <- 'nodes'
    
    # add a column to nodes to hold the IDs
    #gdata$nodes %<>% mutate(id=as.integer(as.factor(name))) %>% rename(label=name)
    gdata$nodes <- gdata$nodes %>% mutate_(id=~as.integer(as.factor(name))) %>% rename_(label=~name)
    # extract node info for color, position, size, shape and color
    
    ## replace from and to in edges with their IDs
    # first create a named vector of ids
    nodesID <- gdata$nodes$id
    names(nodesID) <- gdata$nodes$label
    # now in the edges create the id columns and an edge id
    #gdata$edges %<>% mutate(id=sprintf('e%s', 1:n()), source=nodesID[from], target=nodesID[to]) %>%
    gdata$edges %<>% mutate(id=1:n()) %>% mutate_(source=~nodesID[from], target=~nodesID[to]) %>%
        # and drop the old one
        dplyr::select_(~-from, ~-to)
    
    return(gdata)
}


#' @title igraphToJson
#' @description Convert an igraph object to json
#' @details Converts an igraph object to json with an array holding an array each for nodes and edges.
#' @author Jared P. Lander
#' @aliases igraphToJson
#' @export igraphToJson
#' @param g An igraph object
#' @return A string of json text representing the igraph object as an array holding an array each for nodes and edges.
#' @examples 
#' data(flightGraph)
#' igraphToJson(flightGraph)
#' 
igraphToJson <- function(g)
{
    # convert graph into a list of data.frames
    gdata <- prepIgraphConversion(g)
    
    return(jsonlite::toJSON(gdata))
}


#' @title igraphToGexf
#' @description Convert an igraph object to json
#' @details Converts an igraph object to json with an array holding an array each for nodes and edges.
#' @author Jared P. Lander
#' @aliases igraphToGexf
#' @export igraphToGexf
#' @importFrom jsonlite toJSON
#' @param g An igraph object
#' @return A string of json text representing the igraph object as an array holding an array each for nodes and edges.
#' @examples 
#' data(flightGraph)
#' igraphToGexf(flightGraph)
#' 
igraphToGexf <- function(g)
{
    # convert graph into a list of data.frames
    gdata <- prepIgraphConversion(g)
    
    
}

