% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph_from_links_nodes.R
\name{graph_from_links_nodes}
\alias{graph_from_links_nodes}
\title{Display a graph from a list of links and nodes}
\usage{
graph_from_links_nodes(network_data, main_title = "",
  node_type = c("point", "label"), node_label_title = TRUE,
  family_palette = NULL, layout = "nicely", remove_null = TRUE,
  edge_alpha = TRUE, edge_color = c("#6DBDE6", "#FF8C69"),
  edge_width_range = c(0.2, 2), edge_alpha_range = c(0.4, 1),
  node_label_size = 3, legend_label_size = 10, ...)
}
\arguments{
\item{network_data}{(list of two) : links, nodes with the proper structure}

\item{main_title}{(string, optional) : the title of the network}

\item{node_type}{: \code{point} (default) for the graph to display points and
the label outside the point, or \code{label} to have a node which is the label
 itself (the text size will then be associated to the node degree)}

\item{node_label_title}{(bool, default F) : should the node labels be the
names or title column?
  (e.g. names : CRUDSAL_cat, title : Raw vegetables)}

\item{family_palette}{(list of key = value) : the keys are the family codes
(from family column in the legend), and the values are the corresponding
colors. Can be generated using the \code{\link{family_palette}} func.
USEFUL if there is a need to compare multiple graphs of the same families,
so the color is consistent.
If NULL (default), the palette will be automatically generated using viridis}

\item{layout}{(chr) : the layout to be used to construct the graph}

\item{remove_null}{(bool) : should the nodes with 0 connections (degree 0)
be removed from the graph. default is TRUE.}

\item{edge_alpha}{(bool) : should the edges have a transparent scale?
In addition to the width scale.}

\item{edge_color}{(list) : list of 2. The first element is the color of the
negative edges, the second the positive. Default is \code{c("#6DBDE6", "#FF8C69")}.}

\item{edge_width_range}{: range of the edges width. (default is 0.2 to 2)}

\item{edge_alpha_range}{: if \code{edge_alpha} is TRUE, the range of the alpha
values (between 0 and 1). Default is 0.4 to 1.}

\item{node_label_size}{: the size of the node labels. Default is 3.}

\item{legend_label_size}{: the size of the legend labels. Default is 10.}

\item{...}{: other parameters to pass to ggraph \code{create_layout}}
}
\value{
a list of 3 : \code{igraph} : the igraph object, \code{net} the graph,
\code{deg} the degree table.
}
\description{
Given a list of links and nodes (e.g. from extract_links_nodes func)
Uses igraph and ggraph to display the network plots
Must have the proper structure OR use \code{extract_links_nodes()},
which automatically returns this structure when given an adjacency
matrix and its legend (see documentation for this function)
network_data should be a list of 2 : edges, nodes
For edges (data.frame) : from, to, weight, width, sign (of the weight: neg/pos)
For nodes (data.frame) : name, title, family, family_color (optional)
}
\examples{
adj_matrix <- cor(iris[,-5])
legend <- data.frame(name = colnames(iris[,-5]),
                     title = colnames(iris[,-5]))
graph_iris <- links_nodes_from_mat(adj_matrix, legend)
graph_from_links_nodes(graph_iris, main_title = "Iris graph")
}
\references{
Csardi et al. (2006) <https://igraph.org>

Perdersen (2019) <https://ggraph.data-imaginist.com>
}
\seealso{
\code{\link{graph_from_matrix}}
}
