## install packages

install.packages("httr")
install.packages("jsonlite")
install.packages("tidyverse")
install.packages("tidyjson")

## Load Packages
library(httr)
library(jsonlite)
library(tidyverse)
library(tidyjson)

##define the base url - Chicago Playgrounds
base_url <- 'https://chicagoplaygrounds.com/api/items'
API_url <- paste0(base_url)
## use the GET command to get data
raw_data <- GET(API_url)
status_code(raw_data)
url_content <- content(raw_data)

AJM <- url_content %>% spread_all()


