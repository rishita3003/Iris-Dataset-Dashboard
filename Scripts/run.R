# To run the dashboard locally

setwd("C:\\Users\\Rishita\\Desktop\\Iris-Dataset-Dashboard")

rmarkdown::run("iris_dashboard.Rmd", shiny_args = list(launch.browser = TRUE))
