# Needed libraries
library(RCurl)
library(XML)
library(rvest)

# Downloading page
url <- "http://rbnorway.org/akuma-t7-frames/"

getMovesDataFrame <- function(url) {
  tables <- read_html(url) %>%
    html_nodes("table")
  
  dfs <- vector("list", 2)
  for (i in 1:2) {
    dfs[[i]] = tables[[1]] %>% html_table(header=TRUE)
  }
  
  return(dfs)
}

# Parsing tables
special_moves <- getMovesDataFrame(url)[[1]]
basic_moves = tables[1]
