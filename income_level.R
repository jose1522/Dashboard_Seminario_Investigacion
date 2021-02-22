library(dplyr)
library(readr)
library(highcharter)
library(viridisLite)

income_level <- read_csv("data/final/income_level.csv")

income_level_chart_generator <- function(year, df){
  hcmap(
    "custom/world-robinson-lowres", 
    data = filter(df,Year==year) ,
    name = "Productivity per capita", 
    value = "Level",
    borderWidth = 0,
    nullColor = "#d3d3d3",
    joinBy = c("iso-a3","Code")
  ) %>%
    hc_colorAxis(
      stops = color_stops(colors = viridisLite::viridis(3, begin = 0)),
      type = "linear",
      max=3
    ) %>%
    hc_mapNavigation(enabled = TRUE)
}


