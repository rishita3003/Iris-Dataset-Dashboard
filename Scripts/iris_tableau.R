# Load required libraries
library(dplyr)
library(tidyr)
library(readr)

# Process iris dataset for Tableau
iris_tableau <- iris_processed %>%
 # Add row ID if needed
 mutate(
   Month = rep(month.abb[1:3], length.out = n()),  # Add month dimension
   Year = rep(2020:2024, length.out = n()),        # Add year dimension
   Region = rep(c("North", "South", "East", "West"), length.out = n()), # Geographic dimension
   Growth_Rate = round(Petal.Area/Sepal.Area * 100, 2), # Calculated metric
   Size_Category = case_when(
     Sepal.Area < 15 ~ "Small",
     Sepal.Area < 20 ~ "Medium",
     TRUE ~ "Large"
   )
 ) %>%
 # Round numeric columns
 mutate(across(where(is.numeric), ~round(., 2)))

# Export for Tableau
write.csv(iris_tableau, "data/tableau/iris_tableau.csv", row.names = FALSE)

# Create metadata for measures and dimensions
# metadata <- data.frame(
#  Field = names(iris_tableau),
#  Type = sapply(iris_tableau, class),
#  Role = c("Dimension", rep("Measure", 4), "Dimension", rep("Measure", 2), 
#           rep("Dimension", 4), "Measure", "Dimension")
# )

# Count the fields first
n_fields <- ncol(iris_tableau)

# Create correct number of roles
roles <- c(
  "Dimension",      # id
  rep("Measure", 4), # Sepal/Petal measurements
  "Dimension",      # Species
  rep("Measure", 2), # Areas
  rep("Dimension", 3), # Month, Year, Region
  "Measure",        # Growth_Rate
  "Dimension"       # Size_Category
)

metadata <- data.frame(
  Field = names(iris_tableau),
  Type = sapply(iris_tableau, class),
  Role = roles
)

write.csv(metadata, "data/tableau/tableau_metadata.csv", row.names = FALSE)
