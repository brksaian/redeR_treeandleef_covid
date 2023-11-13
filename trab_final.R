# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# 
# install.packages("igraph")
# BiocManager::install("TreeAndLeaf")
# BiocManager::install("RedeR")
# Instalação dos pacostes
# Só precisa ser rodado uma vez
# install.packages("ggplot2")
# install.packages("tidyverse")
# install.packages("cowplot")
# install.packages("scales")
# install.packages("magrittr")
# install.packages("RColorBrewer")

#--- Load required packages
load_library <- function() {
  library("RedeR")
  library("igraph")
  library("TreeAndLeaf")
  library(cowplot)
  library(dplyr) 
  library(ggplot2)
  library(tidyverse)
  library(scales)
  library(maps)
  library(RColorBrewer)
}

######################### Starting the interface ##############################

start_interface <- function() {
  #--- Set the R-to-Java interface
  rdp <- RedPort()
  
  #--- Initialize the R-to-Java interface
  calld(rdp)
  
  return(rdp)
}

######################### Loading the covid dataset ###########################

union_data <- function() {
  #--- Reading the CSV
  vaccination <- read.csv("vaccination-data.csv")
  global <- read.csv("WHO-COVID-19-global-table-data.csv")
  
  # Rename the 'country' colunm to region in vaccination dataset
  vaccination <- vaccination %>% 
    rename("region" = "COUNTRY")
  
  # Rename the 'Name' colunm to 'region' in global dataset
  global <- global %>% 
    rename("region" = "Name")
  
  #--- Changing the name of the countries which are different of each other
  vaccination$region <- gsub("United States of America", "USA", vaccination$region)
  vaccination$region <- gsub("Viet Nam", "Vietnam", vaccination$region)
  vaccination$region <- gsub("Venezuela (Bolivarian Republic of)", "Venezuela", vaccination$region)
  vaccination$region <- gsub("The United Kingdom", "UK", vaccination$region)
  vaccination$region <- gsub("Syrian Arab Republic", "Syria", vaccination$region)
  vaccination$region <- gsub("Russian Federation", "Russia", vaccination$region)
  vaccination$region <- gsub("United Republic of Tanzania", "Tanzania", vaccination$region)
  vaccination$region <- gsub("Republic of Moldova", "Moldova", vaccination$region)
  vaccination$region <- gsub("Republic of Korea", "South Korea", vaccination$region)
  vaccination$region <- gsub("occupied Palestinian territory", "Palestine", vaccination$region)
  vaccination$region <- gsub("Saint Helena, Ascension and Tristan da Cunha", "Saint Helena", vaccination$region)
  vaccination$region <- gsub("Saint Kitts and Nevis", "Saint Kitts", vaccination$region)
  vaccination$region <- gsub("Micronesia (Federated States of)", "Micronesia", vaccination$region)
  vaccination$region <- gsub("Iran (Islamic Republic of)", "Iran", vaccination$region)
  vaccination$region <- gsub("Falkland Islands (Malvinas)", "Falkland Islands", vaccination$region)
  vaccination$region <- gsub("Curaçao", "Curacao", vaccination$region)
  vaccination$region <- gsub("Congo", "Democratic Republic of the Congo", vaccination$region)
  vaccination$region <- gsub("Cabo Verde", "Cape Verde", vaccination$region)
  vaccination$region <- gsub("Brunei Darussalam", "Brunei", vaccination$region)
  vaccination$region <- gsub("British Virgin Islands", "Virgin Islands", vaccination$region)
  vaccination$region <- gsub("Bolivia (Plurinational State of)
  ", "Bolivia", vaccination$region)
  vaccination$region <- gsub("Antigua and Barbuda", "Barbuda", vaccination$region)
  vaccination$region <- gsub("Cabo Verde", "Cape Verde", vaccination$region)
  
  global$region <- gsub("United States of America", "USA", global$region)
  global$region <- gsub("Viet Nam", "Vietnam", global$region)
  global$region <- gsub("Venezuela (Bolivarian Republic of)", "Venezuela", global$region)
  global$region <- gsub("The United Kingdom", "UK", global$region)
  global$region <- gsub("Syrian Arab Republic", "Syria", global$region)
  global$region <- gsub("Russian Federation", "Russia", global$region)
  global$region <- gsub("United Republic of Tanzania", "Tanzania", global$region)
  global$region <- gsub("Republic of Moldova", "Moldova", global$region)
  global$region <- gsub("Republic of Korea", "South Korea", global$region)
  global$region <- gsub("occupied Palestinian territory", "Palestine", global$region)
  global$region <- gsub("Saint Helena, Ascension and Tristan da Cunha", "Saint Helena", global$region)
  global$region <- gsub("Saint Kitts and Nevis", "Saint Kitts", global$region)
  global$region <- gsub("Micronesia (Federated States of)", "Micronesia", global$region)
  global$region <- gsub("Iran (Islamic Republic of)", "Iran", global$region)
  global$region <- gsub("Falkland Islands (Malvinas)", "Falkland Islands", global$region)
  global$region <- gsub("Curaçao", "Curacao", global$region)
  global$region <- gsub("Congo", "Democratic Republic of the Congo", global$region)
  global$region <- gsub("Cabo Verde", "Cape Verde", global$region)
  global$region <- gsub("Brunei Darussalam", "Brunei", global$region)
  global$region <- gsub("British Virgin Islands", "Virgin Islands", global$region)
  global$region <- gsub("Bolivia (Plurinational State of)
  ", "Bolivia", global$region)
  global$region <- gsub("Türkiye", "Turkey", global$region)
  global$region <- gsub("Antigua and Barbuda", "Barbuda", global$region)
  global$region <- gsub("Palestine, including east Jerusalem", "Palestine", global$region)
  global$region <- gsub("Northern Mariana Islands (Commonwealth of the)", "Northern Mariana Islands", global$region)
  
  #--- 
  union_ds <- left_join(vaccination, global, by="region")
  
  total_union <- length(union_ds$region)
  total_global <- length(global$region)
  total_vaccination <- length(vaccination$region)
  
  diff_global <- total_global - total_union
  diff_global
  # 9
  
  # See the columns names of the union
  cols_names_union <- colnames(union_ds)
  cols_names_union
  # [1] "region"                                                       "ISO3"                                                        
  # [3] "WHO_REGION"                                                   "DATA_SOURCE"                                                 
  # [5] "DATE_UPDATED"                                                 "TOTAL_VACCINATIONS"                                          
  # [7] "PERSONS_VACCINATED_1PLUS_DOSE"                                "TOTAL_VACCINATIONS_PER100"                                   
  # [9] "PERSONS_VACCINATED_1PLUS_DOSE_PER100"                         "PERSONS_LAST_DOSE"                                           
  # [11] "PERSONS_LAST_DOSE_PER100"                                     "VACCINES_USED"                                               
  # [13] "FIRST_VACCINE_DATE"                                           "NUMBER_VACCINES_TYPES_USED"                                  
  # [15] "PERSONS_BOOSTER_ADD_DOSE"                                     "PERSONS_BOOSTER_ADD_DOSE_PER100"                             
  # [17] "WHO.Region"                                                   "Cases...cumulative.total"                                    
  # [19] "Cases_cumulative_total_per_100000_population"               "Cases_newly_reported_in_last_7_days"                       
  # [21] "Cases_newly_reported_in_last_7_days_per_100000_population"  "Cases_newly_reported_in_last_24_hours"                     
  # [23] "Deaths_cumulative_total"                                    "Deaths_cumulative_total_per_100000_population"             
  # [25] "Deaths_newly_reported_in_last_7_days"                       "Deaths_newly_reported_in_last_7_days_per_100000_population"
  # [27] "Deaths_newly_reported_in_last_24_hours"                    
  
  ## - Print the difference between the global and union dataframes
  df_diff_global <- anti_join(vaccination, global, by = "region")
  df_diff_global$region
  # "Bonaire, Sint Eustatius and Saba"
  
  
  df_diff_vaccination <- anti_join(global, vaccination, by = "region")
  df_diff_vaccination$region
  # "Global"                          "Réunion"                         "Mayotte"                         "United States Virgin Islands" 
  # "Saint Martin"                    "Saint Barthélemy"                "Saint Pierre and Miquelon"       "Other"   
  # "Holy See"                        "Democratic People's South Korea"
  
  diff_vaccination <- total_vaccination - total_union
  diff_vaccination
  # 0
  
  # Transform "region" column into row names
  rownames(union_ds) <- union_ds$region
  
  return(union_ds)
}

######################## Plot in redeR ########################################
tl_generator <- function(continente, union_ds, rdp) {
  resetd(rdp)
    # Filtering the american countries
  union_ds_filtered <- subset(union_ds, WHO_Region == continente)
  
  # selecting only the columns that will be used
  ds = union_ds_filtered[, c("region", "Deaths_cumulative_total_per_100000_population", "PERSONS_VACCINATED_1PLUS_DOSE_PER100")]
  
  # Renaming the columns names
  ds <- ds %>% 
    rename("Deaths_per_100k" = "Deaths_cumulative_total_per_100000_population")
  
  ds <- ds %>% 
    rename("Vaccinated_per_100k" = "PERSONS_VACCINATED_1PLUS_DOSE_PER100")
  
  any(is.na(ds))
  # [1] TRUE
  
  # 
  ds_wo_na <- na.omit(ds)
  
  any(is.na(ds_wo_na))
  # [1] FALSE
  
  nrow(ds_wo_na)
  # [1] 228
  
  ncol(ds_wo_na)
  # [1] 2
  
  # Calcular a matriz de distância
  dist_matrix <- dist(ds_wo_na)
  
  #-- Generate an 'hclust' object from the dataset
  hc <- hclust(dist_matrix)
  
  # -- Convert the 'hclust' object into a 'tree-and-leaf' object
  tal <- treeAndLeaf(hc)
  
  # --- Map 'iris' variables to the tree-and-leaf graph
  # Note: 'refcol = 0' indicates that 'dist_matrix' rownames will be used as mapping IDs
  tal <- att.mapv(g = tal, dat = ds_wo_na, refcol = 0)
  
  # Defining the color palette
  # Displaying all the pallets
  # display.brewer.all()
  pal <- brewer.pal(7, "Spectral")
  
  # resetd(rdp)
  #--- Set node attributes using the 'att.setv' wrapper function
  tal <- att.setv(tal, from="region", to="nodeAlias")
  tal <- att.setv(g = tal, from = "Vaccinated_per_100k", to = "nodeColor", cols = pal, nquant = 7, title = "Ola")
  tal <- att.setv(g = tal, from = "Deaths_per_100k", to = "nodeSize", xlim=c(50,120,5), nquant = 7)
  
  #--- Set other attributes using igraph shortcuts
  V(tal)$nodeFontSize[V(tal)$isLeaf] <- 40
  E(tal)$edgeColor <- "grey70"
  
  #--- Send the tree-and-leaf graph to RedeR
  addGraph(rdp, tal, gzoom=50)
  
  #--- Suggestion: anchor inner nodes to adjust the final layout
  selectNodes(rdp, V(tal)$name[!V(tal)$isLeaf], anchor=TRUE)
  
  #--- Call 'relax' to fine-tune the leaf nodes
  relax(rdp, p1=30, p2=60, p3=10, p4=120, p5=20, p6=100, p7=10)
  
  #--- Add legends
  addLegend.color(rdp, tal, title="Vacinados a cada 100k de pessoas")
  addLegend.size(rdp, tal, title="Mortes a cada 100k de pessoas", position="bottomright")
}

#################################### Main #####################################
load_library()
rdp <- start_interface()
union_ds <- union_data()

view(union_ds)

tl_generator("Americas", union_ds, rdp)
tl_generator("Europe", union_ds, rdp)
tl_generator("Africa", union_ds, rdp)
tl_generator("Western Pacific", union_ds, rdp)