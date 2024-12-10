#Hello Julius v4

#empty enviornment 
rm(list = ls())

### Packages

library(dplyr)
library(stargazer)




## Load  datasets

file_path_relevantdataI <- "~/Desktop/Seventh Semester/GlobalPov/PS3/ps3data.csv"
ps3dataI <- read.csv(file_path_relevantdataI)
head(ps3dataI)
stargazer(ps3dataI, type = "text")

file_path_relevantdataII <- "~/Desktop/Seventh Semester/GlobalPov/PS3/swp.csv"
ps3dataII <- read.csv(file_path_relevantdataII)
head(ps3dataII)
stargazer(ps3dataII, type = "text")




# Question 2 - looking at welfare reforms with ps3dataII

### a) 
reg1 <- lm(employed ~ social_program, data = ps3dataII)
summary(reg1)

reg2 <- lm(employed ~ social_program + hsgrad + city + woman, data = ps3dataII)
summary(reg2)

stargazer(reg1, reg2, 
          type = "text", 
          title = "Regression Results",
          dep.var.labels = "Employed",
          covariate.labels = c("Social Program", "HS Grad", "City", "Woman"),
          align = TRUE)




#### now in another regression we want to add even further controls 

reg3 <- lm(employed ~ social_program + hsgrad + city + woman + avg_benefit + earnings, data = ps3dataII)
summary(reg3)