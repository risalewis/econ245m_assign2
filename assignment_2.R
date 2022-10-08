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
?filter
neighborhoods <- airbnb %>% count(neighborhood) %>% filter(!is.na(neighborhood)) 
neighborhoods <- neighborhoods %>% arrange(desc(n)) %>% head(20)
#2.2.c
airbnb_top_neighborhoods <- airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)
View(airbnb_top_neighborhoods)
#2.2.d
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>%  group_by(neighborhood) %>% 
  summarize(avg_square_feet = mean(square_feet, na.rm=TRUE),  avg_price = mean(price, na.rm=TRUE),
            sd_price = sd(price, na.rm=TRUE), max_price = max(price, na.rm=TRUE), min_price = min(price, na.rm=TRUE)) %>%
            arrange(desc(avg_square_feet))
#2.2.e
highest_avg_square_ft <- summary_stats_top_neighborhoods[1,2]

# 2.f.
second_avg_price <- as.numeric((summary_stats_top_neighborhoods %>% arrange(desc(avg_price)))[2, "avg_price"])






