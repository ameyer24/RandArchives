library(httr2)
library(jsonlite)

# your institution's CONTENTdm Website URL
base_url <- "https://collections.carli.illinois.edu"
contentdm_string <- "/digital/bl/dmwebservices/index.php?q="
contentdm_function <- "dmGetCollectionFieldVocabulary"
contentdm_format <- "json"
contentdm_alias <- "npu_alva"


get_collection_list <- paste0(base_url,contentdm_string,contentdm_function,"/",contentdm_alias,"/",contentdm_format)
get_collection_list
