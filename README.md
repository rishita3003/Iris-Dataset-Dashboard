# Iris-Dataset-Dashboard

## Instructions to run

Add 
options(shiny.port = 3838)
Sys.setenv(RSTUDIO_PANDOC = "C:/Users/Rishita/AppData/Local/Pandoc")


## Run
rmarkdown::run("iris_dashboard.Rmd", shiny_args = list(launch.browser = TRUE))


## Deploy
Set the environment variables for your `shinyapps.io` account and the directory to be deployed.
Then run the deploy.R file 

