#' @title Imaginary flight network
#' 
#' @description Network graph of an imaginary airline's flight routes.
#'
#' @format An igraph graph with 20 nodes and 192 edges
#' \itemize{
#'   \item node: An origin or destination city
#'   \item edge: A flight between two cities
#' }
"flightGraph"

#' @title  Plotting layout for nodes of a network about flight data
#' 
#' @description Plotting layout for nodes of a network about flight data
#'
#' @format A matrix of two columns and 20 rows
#' \itemize{
#'   \item column 1: X position
#'   \item column 2: X position
#' }
"flightLayout"
