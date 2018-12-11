library(ggplot2)
library(tidyverse)
library(readxl)
library(leaflet)
library(htmlwidgets)
library(shiny)
library(shinythemes)
library(leaflet.extras)
library(magrittr)

#This sits in the MOS folder

#filestring <- "/home/waljock/Projects/R_Projects/Data/DEALER_PIPE_GEO.xlsx"

filestring <- "C:/Users/HMA03468/Documents/R_Data/Git/geoShiny/DEALER_PIPE_GEO.xlsx"

j <- read_excel(filestring)

#s <- read_excel("/home/waljock/Projects/R_Projects/Data/DEALER_PIPE_GEO.xlsx")
j$MODEL_YEAR <- as.character(j$MODEL_YEAR)
# grouped_Series <- unique(subset(j[c(5)],(j$MODEL_YEAR>="2018") & (j$ADI_DS_UNITS >= 1)))
# grouped_MY <- (unique(subset(j[c(1)],(j$MODEL_YEAR>="2018") & (j$ADI_DS_UNITS >= 1))))

grouped <- subset(j,(j$MODEL_YEAR>="2019") & (j$ADI_DS_UNITS >= 1) & (j$SERIES_CD == '4') & (j$ADI_DS_UNITS >= 2))

qpal <- colorBin("RdBu", grouped$MOS, n = 1000)


leaflet(grouped) %>% 
  addTiles() %>%
  addHeatmap(intensity = ~MOS*10000, blur = 25, max = 1 , radius =20)
             #              cellSize = 5)
# leaflet(map) %>% addTiles() %>%
#   addHeatmap(data = filteredData(), intensity = ~ADI_DS_UNITS, blur = 50, max = .5 , radius =10,
#              cellSize = 5)
