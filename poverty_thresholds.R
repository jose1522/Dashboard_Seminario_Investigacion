library(dplyr)
library(readr)
library(highcharter)
library(viridisLite)

poverty_threshold <- read_csv("data/final/poverty_thresholds.csv") %>%
                     mutate(across(4, round, 2))

poverty_threshold_chart_generator <- function(region, df){
  hchart(filter(df,Entity==region), "areaspline", 
         hcaes(x=Year, y=Percentage, group=Threshold)) %>% 
    hc_colors(viridisLite::viridis(7)) %>%
    hc_legend(enabled = TRUE,align = "left", verticalAlign = "top") %>%
    hc_plotOptions(areaspline = list(opacity = 0.5))
}

poverty_threshold_regions_chart_generator <- function(threshold, df){
  hchart(filter(df,Threshold==threshold), "spline", 
         hcaes(x=Year, y=Percentage, group=Entity)) %>% 
    hc_colors(viridisLite::viridis(7)) %>%
    hc_legend(enabled = TRUE,align = "left", verticalAlign = "top") %>%
    hc_plotOptions(areaspline = list(opacity = 0.5))
}

