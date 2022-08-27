library(readr)
library(tidyverse)
library(dplyr)

shots_data <- read_csv("shots_data.csv")

str(shots_data)
sum(is.na(shots_data))

teamA <- shots_data %>% filter(team == "Team A")
teamB <- shots_data %>% filter(team == "Team B")

##TeamA 2pt stats 
teamA_2PTA <- teamA %>% 
  filter((x<22 & y<7.8) & (x>-22 & y<7.8) | ((x<23.75 & y>7.8) & (x>-23.75 & y>7.8)))
teamA_2PTA %>% count(fgmade)

teamA_2PTA_percent <- round(((262/280) * 100),3)
teamA_2PTeFG <- round((116/262)*100,3)

##TeamA Corner3 stats
teamA_Corner3_FGA <- teamA %>% filter((x>=22 & y<=7.8) | (x<=-22 & y<=7.8))
teamA_Corner3_FGA %>% count(fgmade)
teamA_Corner3_FGA_percent <- round(((18/280)*100),3)
teamA_Corner3_eFG <- round((9/18)*100,3)

#TeamA NC3 stats
teamA_NC3_FGA <- teamA %>% filter((x>-22 & y>23.75) | (x<22 & y>23.75)) 
teamA_NC3_FGA %>% count(fgmade)
teamA_NC3_FGA_percent <- round((29/280)*100,3)
teamA_NC3_FGA <- round((7/29)*100,3)

#TeamB 2pt stats
teamB_2PTA <- teamB %>% 
  filter((x<22 & y<7.8) & (x>-22 & y<7.8) | ((x<23.75 & y>7.8) & (x>-23.75 & y>7.8)))
teamB_2PTA %>% count(fgmade)

teamB_2PTA_percent <- round(((209/224) * 100),3)
teamB_2PTeFG <- round((121/224)*100,3)

##TeamB Corner3 stats
teamB_C3_FGA <- teamB %>% filter((x>=22 & y<=7.8) | (x<=-22 & y<=7.8))
teamB_C3_FGA %>% count(fgmade)
teamB_C3_FGA_percent <- round((12/224)*100,3)
teamB_C3_eFG <- round((4/12)*100,3)

#TeamB NC3 stats
teamB_NC3_FGA <- teamB %>% filter((x>=23.75 & y>7.8) | (x<=-23.75 & y>7.8) | (y>23.75))
teamB_NC3_FGA %>% count(fgmade)
teamB_NC3_FGA_percent <- round((27/224)*100,3)
teamB_NC3_FGA <- round((5/27)*100,3)
