library(dplyr)
library(readr)
library(highcharter)
library(viridisLite)

region_productivity <- read_csv("data/final/region_productivity.csv") %>% 
                        select(-!!c("avh","emp","rgdpo","avh_emp")) %>%
                        rename(Productivity=productivity, Year=YearCode) %>%
                        mutate(across(3, round, 2))

region_productivity_chart <- hchart(region_productivity, "spline", hcaes(x=Year, y=Productivity, group=Region)) %>% 
                        hc_colors(viridis(7))

country_productivity <- read_csv("data/final/country_productivity.csv") %>% 
                        select(-!!c("avh","emp","rgdpo","avh_emp")) %>%
                        rename(Productivity=productivity, Year=YearCode) %>%
                        mutate(across(4, round, 2))

country_productivity_chart_generator <- function(year, df){
  hcmap(
    "custom/world-robinson-lowres", 
    data = filter(df,Year==year) ,
    name = "Productivity per capita", 
    value = "Productivity",
    borderWidth = 0,
    nullColor = "#d3d3d3",
    joinBy = c("iso-a3","RegionCode")
  ) %>%
    hc_colorAxis(
      stops = color_stops(colors = viridisLite::viridis(5, begin = 0.1)),
      type = "linear",
      max=100
    ) %>%
    hc_mapNavigation(enabled = TRUE)
  
}


