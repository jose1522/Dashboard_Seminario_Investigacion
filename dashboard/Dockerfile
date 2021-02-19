FROM rocker/shiny-verse
CMD mkdir ./app
WORKDIR ./app
RUN R -e "install.packages(c('flexdashboard', 'knitr', 'import', 'highcharter','viridisLite', 'readr'), dependencies = TRUE, repo='http://cran.r-project.org')"
EXPOSE 8080
