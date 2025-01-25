# To deploy the dashboard to shinyapps.io, run this file
library(rsconnect)
library(dotenv)

load_dot_env()

message("Deploying app for account: ", "8gf8vy-rishita-agarwal")

rsconnect::setAccountInfo(
    name = "8gf8vy-rishita-agarwal",#Sys.getenv("SHINY_ACCOUNT_NAME"),
    token = "218767E4A27090EE4E318A06272B4329",#Sys.getenv("SHINY_TOKEN"),
    secret = #Sys.getenv("SHINY_SECRET")
)

rsconnect::deployApp(appDir = "C:/Users/Rishita/Desktop/Iris-Dataset-Dashboard"#Sys.getenv("APP_DIR")
)