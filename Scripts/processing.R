library(dplyr)
library(readr)
library(tidyverse)
library(qs)


data(iris)

#print(head(iris))

iris_processed <- iris %>%
  mutate(
    id = row_number(),
    Species = as.factor(Species),
    Sepal.Area = Sepal.Length * Sepal.Width,
    Petal.Area = Petal.Length * Petal.Width
  )

print(head(iris_processed))

# Calculate summary statistics
iris_summary <- iris_processed %>%
  group_by(Species) %>%
  summarise(
    across(where(is.numeric), list(
      mean = ~mean(.x, na.rm = TRUE),
      sd = ~sd(.x, na.rm = TRUE),
      min = ~min(.x, na.rm = TRUE),
      max = ~max(.x, na.rm = TRUE)
    ))
  )

print(iris_summary)

qsave(iris_processed, "Data/iris/iris_processed.qs")
qsave(iris_summary, "Data/iris/iris_summary.qs")
qsave(iris, "Data/iris/iris_raw.qs")

# Create metadata
metadata <- data.frame(
  filename = c("iris_raw.qs", "iris_processed.qs", "iris_summary.qs"),
  format = c(rep("QS", 3)),
  description = rep(c("Original iris dataset",
                     "Processed dataset with additional features",
                     "Summary statistics by species"), 2)
)
saveRDS(metadata, "Data/metadata/meta.rds")