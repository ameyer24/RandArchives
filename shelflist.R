library(tidyverse)
library(here)
## import CSV file
ArchivesSpace_report <- read.csv("report.csv", skip = 2)
## delete column junk
ArchivesSpace_report1 <- select(ArchivesSpace_report,
                                -c(1,2,4,6,7,9,12,17))
## divide location_in_room

ArchivesSpace_report2 <- ArchivesSpace_report1 %>%
  separate(location_in_room,
           c("Range","Bay","Shelf"),
           sep = ",")

## Tidy this data
## Focus on just the resources

Resource_Shelf_List <- ArchivesSpace_report2 %>%
  select(-starts_with("accessions")) %>%
  rename("ID" = "resources_identifier") %>%
  rename("Title" = "resources_title") %>%
  rename("Box" = "resources_containers_container") %>%
  rename("Container Profile" = "resources_containers_container_profile") %>%
  mutate(type = "Resource")


Accession_Shelf_List <- ArchivesSpace_report2 %>%
  select(-starts_with("resource"))%>%
  rename("ID" = "accessions_identifier") %>%
  rename("Title" = "accessions_title") %>%
  rename("Box" = "accessions_containers_container") %>%
  rename("Container Profile" = "accessions_containers_container_profile") %>%
  mutate(type = "Accession")


## combine those two
shelf_list <- rbind(Resource_Shelf_List, Accession_Shelf_List)

psl <- shelf_list %>%
  filter(ID != "")%>%
  relocate(type, .after=Shelf) %>%
  distinct()%>%
  ## get rid of stuff I don't need
  select(-c(building,room)) %>%
  filter(str_detect(Range, "Range")) %>%
  arrange(Range,Bay,Shelf)

write_csv(psl, "psl.csv")
