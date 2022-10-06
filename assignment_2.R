#####################################################
### Risa Lewis and Camila Paleo
### Author of Branch: Risa Lewis
### ECON 245M HW 2

library(tidyverse)

setwd("C:/Users/risal/Documents/UCSB_22_23/FallQuarter2022/245M/R/Data")

# 1.a.
airbnb <- read_csv("assign_2.csv")
# 1.c.
airbnb <- airbnb %>%
  rename("neighborhood" = "neighbourhood")

# 2.a.
neighborhoods <- airbnb %>%  count(neighborhood)
# 2.b.
neighborhoods <- neighborhoods %>%
  filter(neighborhood != "NA") %>%
  arrange(desc(n)) %>%
  head(n = 20)
# 2.c.
airbnb_top_neighborhoods <- filter(airbnb, neighborhood %in% pull(neighborhoods[,1]))
# or
# test <- filter(airbnb, neighborhood %in% pull(neighborhoods,neighborhood))
# here the syntax is vector <- pull(data, column) 

# 2.d. 
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% 
  group_by(neighborhood) %>% 
  summarize(avg_square_feet = mean(square_feet, na.rm=TRUE), 
            avg_price = mean(price, na.rm=TRUE), 
            sd_price = sd(price, na.rm=TRUE), 
            max_price = max(price, na.rm=TRUE), 
            min_price = min(price, na.rm=TRUE)) %>% 
  arrange(desc(avg_square_feet))

# 2.e.
highest_avg_square_ft <- summary_stats_top_neighborhoods[1,2]

# 2.f.
second_avg_price <- summary_stats_top_neighborhoods[2,3]