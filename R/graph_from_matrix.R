#' Display a graph from an adjacency matrix
#'
#' Given an adjacency matrix and a legend, displays the graph.
#' This is a shortcut function, rather than using \code{links_nodes_from_mat()}
#' and \code{graph_from_links_nodes()}.
#'
#' @param adjacency_matrix : a matrix of size n x n, each element being
#'  a number explaining the relationship (coefficient, information)
#'  between two variables given in the column and row names
#'  /!\ As this code is to draw undirected graphs, only the lower
#'  triangular part of association matrix is used to extract the information
#' @param legend : a data frame of columns in order :
#'     1) name, str : name of the node in the adjacency matrix, e.g.
#'     CRUDSAL_cat
#'     2) title, str : name of the node, e.g. Raw vegetables
#'     3) family, factor : (optional) the family the node belongs to,
#'     e.g. Vegetables
#' @param threshold numeric) : a number defining the minimal threshold.
#' If the weights are less than this threshold, they will be set to 0.
#' @param abs_threshold (bool) : should the threshold keep negative values,
#'  e.g. if \code{abs_threshold} is set to \code{TRUE}, and threshold is set
#'  to 0.1, all weights between -0.1 and 0.1 will be set to 0
#' @param filter_nodes (bool) : should the variables not in the adjacency
#' matrix be displayed on the graph? Default is TRUE
#' CAREFUL : if set to \code{TRUE}, be sure to have the same colors in the
#' family legend of the graphs. A fixed palette can be set using
#' \code{\link{family_palette}}. Default is TRUE.
#' @param main_title (string, optional) : the title of the network
#' @param node_type : \code{point} (default) for the graph to display points
#' and the label outside the point, or \code{label} to have a node which is the
#' label itself (the text size will then be associated to the node degree)
#' @param node_label_title (bool, default F) : should the node labels be the
#' names or title column? (e.g. names : CRUDSAL_cat, title : Raw vegetables)
#' @param family_palette (list of key = value) : the keys are the family codes
#'  (from family column in the legend),  and the values are the corresponding
#'  colors. Can be generated using \code{\link{family_palette}}.
#'  USEFUL if there is a need to compare multiple graphs of the same families,
#'  so the color is consistent.
#'  If NULL (default), the palette will be automatically generated using viridis
#' @param layout (chr) : the layout to be used to construct the graph
#' @param remove_null (bool) : should the nodes with 0 connections (degree 0)
#' be removed from the graph. Default is TRUE.
#' @param edge_alpha (bool) : should the edges have a transparent scale?
#' In addition to the width scale.
#' @param edge_color (list) : list of 2. The first element is the color of the
#' negative edges, the second the
#' positive. Default is \code{c("#6DBDE6", "#FF8C69")}.
#' @param edge_width_range : range of the edges width. (default is 0.2 to 2)
#' @param edge_alpha_range : if \code{edge_alpha} is TRUE, the range of the
#' alpha values (between 0 and 1). Default is 0.4 to 1.
#' @param node_label_size : the size of the node labels. Default is 3.
#' @param legend_label_size : the size of the legend labels. Default is 10.
#' @param ... : other parameters to pass to ggraph `create_layout`
#' @return a list of 3 : \code{igraph} : the igraph object, \code{net} the graph,
#' \code{deg} the degree table.
#' @examples
#' adj_matrix <- cor(iris[,-5])
#' legend <- data.frame(name = colnames(iris[,-5]),
#'                      title = colnames(iris[,-5]))
#' graph_from_matrix(adj_matrix, legend, main_title = "Iris graph")
#' @references
#' Csardi et al. (2006) <https://igraph.org>
#'
#' Perdersen (2019) <https://ggraph.data-imaginist.com>
#' @seealso \code{\link{graph_from_links_nodes}}
#' @export
graph_from_matrix <- function(adjacency_matrix,
                              legend,
                              threshold = 0,
                              abs_threshold = TRUE,
                              filter_nodes = TRUE,
                              main_title = "",
                              node_type = c("point", "label"),
                              node_label_title = TRUE,
                              family_palette = NULL,
                              layout = "nicely",
                              remove_null = TRUE,
                              edge_alpha = TRUE,
                              edge_color = c("#6DBDE6", "#FF8C69"),
                              edge_width_range = c(0.2,2),
                              edge_alpha_range = c(0.4, 1),
                              node_label_size = 3,
                              legend_label_size  = 10,
                              ...) {

  # Extract the links and nodes from the adjacency matrix
  network_link_nodes <- links_nodes_from_mat(adjacency_matrix = adjacency_matrix,
                                            legend = legend,
                                            threshold = threshold,
                                            abs_threshold = abs_threshold,
                                            filter_nodes = filter_nodes)

  # Display the graph
  graph_from_links_nodes(network_link_nodes, main_title = main_title,
                         node_type = node_type,
                         node_label_title = node_label_title,
                         family_palette = family_palette,
                         layout = layout,
                         remove_null = remove_null,
                         edge_alpha = edge_alpha,
                         edge_color = edge_color,
                         edge_width_range = edge_width_range,
                         edge_alpha_range = edge_alpha_range,
                         node_label_size = node_label_size,
                         legend_label_size  = legend_label_size,
                         ...)
}
