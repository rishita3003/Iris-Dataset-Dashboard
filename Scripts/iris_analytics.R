library(dplyr)
library(qs)

iris_processed <- qread("Data/iris/iris_processed.qs")

iris_analytics <- iris_processed %>%
 group_by(Species) %>%
 mutate(
   Sepal.Length_zscore = scale(Sepal.Length),
   Sepal.Width_zscore = scale(Sepal.Width),
   Petal.Length_zscore = scale(Petal.Length),
   Petal.Width_zscore = scale(Petal.Width),
   
   Sepal.Length_outlier = abs(Sepal.Length_zscore) > 2,
   Sepal.Width_outlier = abs(Sepal.Width_zscore) > 2,
   Petal.Length_outlier = abs(Petal.Length_zscore) > 2,
   Petal.Width_outlier = abs(Petal.Width_zscore) > 2,
   
   Area_ratio = Sepal.Area/Petal.Area,
   Length_ratio = Sepal.Length/Petal.Length,
   Width_ratio = Sepal.Width/Petal.Width
 ) %>%
 ungroup()

qsave(iris_analytics, "Data/iris/iris_analytics.qs")