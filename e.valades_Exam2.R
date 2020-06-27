
#clear the environment
rm(list = ls(all=TRUE))

#load the inequality dataset
library(rio)
library(stargazer)
inequality_data = import("inequality.xlsx", which = 1)

#looking at the data 
head(inequality_data)
summary(inequality_data)
table(inequality_data$inequality_gini)


#inequality gini subset for Sweden and Denmark
inequality_sub <- subset(inequality_data, 
                         select = c("Denmark","Sweden"))



#accent removal function
remove.accents <- function(s){
  old1 <- "ú"
  new1 <- "u"
  s1 <- chartr(old1, new1, s)
}

#actually removing the accent in Belarus
inequality_data$country <- remove.accents(inequality_data$country)

#quick peak at the data frame
head(inequality_data)

#inequality gini scores
inequality_data$inequality_gini 

library(dplyr)
inequality_sorted <- filter(inequality_data, inequality_gini == 25)


