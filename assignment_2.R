#2.1.a open and save data
library(readr)
library(tibble) 
library("tidyverse")
library("dplyr")
airbnb <- read_csv("assign_2.csv")
View(airbnb)
#2.1.c
colnames(airbnb)
airbnb <- airbnb %>% rename(, "neighborhood" = "neighbourhood")
colnames(airbnb)
#2.2.a
neighborhoods <- airbnb %>% count(neighborhood)
View(neighborhoods)
#2.2.b
#Update the neighborhoods tibble from part (a) to get rid of any NA rows in the neighborhood
#column using the filter function, and then use the arrange and head functions to get the top
#20 most frequently listed neighborhoods in descending order. Hence, your tibble should have two
#columns: neighborhood and n, and should have no more than 20 rows.