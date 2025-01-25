# Iris-Dataset-Dashboard

## Instructions to run

Add 
options(shiny.port = 3838)
Sys.setenv(RSTUDIO_PANDOC = "C:/Users/Rishita/AppData/Local/Pandoc")


## Run
rmarkdown::run("iris_dashboard.Rmd", shiny_args = list(launch.browser = TRUE))
