library(dplyr)
library(readr)
library(highcharter)
library(viridisLite)

gdp_total <- read_csv("data/final/gdp_total.csv") %>%
              mutate(across(4, round, 2))%>%
              mutate(across(5, round, 0))

gdp_capita <- read_csv("data/final/gdp_capita.csv") %>%
              mutate(across(4, round, 2))%>%
              mutate(across(5, round, 0))

gdp_capita_pct <- read_csv("data/final/gdp_capita_pct.csv") %>%
              mutate(across(4, round, 2))



gdp_capita_growth_chart_generator <- function(year, df){
  hchart(filter(df,Year==year), "bar", 
         hcaes(x=Region, y=Growth, group=Region)) %>% 
    hc_colors(viridisLite::viridis(7)) %>%
    hc_legend(enabled = FALSE)
}

gdp_capita_chart <- hchart(gdp_capita, "spline", 
          hcaes(x=Year, y=GDPC, group=Region)) %>% 
          hc_colors(viridisLite::viridis(7)) %>%
          hc_legend(enabled = TRUE,align = "left", verticalAlign = "top")

gdp_capita_pie_chart_generator <- function(year_input, df){
  df = filter(df,year==year_input) %>% select(-!c("region","pct")) %>% arrange(desc(pct))
  return(
    hchart(df, "pie", hcaes(name=region, y=pct)) %>% 
      hc_colors(viridisLite::viridis(7)) %>%
      hc_legend(enabled = FALSE)
  )
}

