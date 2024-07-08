## install packages

install.packages("httr2")
install.packages("jsonlite")
# install.packages("tidyverse")
# install.packages("tidyjson")
# install.packages("jsonld")

## Load Packages
library(httr2)
library(jsonlite)
# library(tidyverse)
# library(tidyjson)
# library(jsonld)

##define the base url for the Omeka S site.
base_url <- 'https://chicagoplaygrounds.com/api'
## use the GET command to get data
req <- request(base_url)
req

req_perform(req,
            verbosity = 3)

0
request("http://example.com") |> req_dry_run()

resp <- request(base_url) |> req_perform()

resp |> resp_body_json()

status_code(raw_data)
url_content <- content(raw_data,as="parsed")



# https://cran.r-project.org/web/packages/tidyjson/vignettes/introduction-to-tidyjson.html


