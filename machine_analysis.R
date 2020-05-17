setwd("C:\\Users\\lenovco\\Onedrive\\Desktop\\R Datasets")
getwd()
util <- read.csv("P3-Machine-Utilization.csv")
head(util, 12)
str(util)
summary(util)
#derive utilization column 
util$Utilization <- 1- util$Percent.Idle
head(util, 12)
?POSIXct
util$PosixTime <-  as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M")
head(util, 12)
summary(util)

#how to rearrange columns 
util$Timestamp <- NULL
head(util, 12)
util <- util[, c(4,1,2,3)]
head(util,12)

#What is a list?
RL1 <- util[util$Machine == "RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)
summary(RL1)

#Construct a list
util_stats_rl1 <- c(min(RL1$Utilization, na.rm = TRUE),
                    mean(RL1$Utilization, na.rm = TRUE),
                    max(RL1$Utilization, na.rm = TRUE))
util_stats_rl1

util_under_90_flag <- length(which(RL1$Utilization<0.90))>0
util_under_90_flag

list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

#Naming components of a list 
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")
list_rl1
#Other way of naming list 
rm(list_rl1)
list_rl1 <- list(Machine = "RL1", Stats = util_stats_rl1, LowThreshold = util_under_90_flag)
list_rl1

#Extracting elements of the list 
#Three ways 
#1 []- prints out a list 
#2 [[]] - prints out a particular element of the list 
#3 $ - same as [[]] but prettier

list_rl1 
list_rl1 [1]

list_rl1 [[1]]

list_rl1$Machine

list_rl1 [2]
typeof(list_rl1 [2])
list_rl1 [[2]]
typeof(list_rl1 [[2]])
list_rl1$Stats
typeof(list_rl1$Stats)
#how to access the maximum utility ie the third elenment of the stats vector 
list_rl1$Stats[3]
list_rl1 [[2]][3]

#Adding and deleting components from a list 
list_rl1
list_rl1[4] <- "New Information"
list_rl1
#Another way to add component via $ sign 
list_rl1$UnknownHours <-RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1

# Remove a component : Use the null method 
list_rl1[4] <- NULL
list_rl1

#Notice: numertaion has shifted
list_rl1[4]
# Add another component
list_rl1$Data <- RL1
list_rl1
summary(list_rl1)
str(list_rl1)

#Subsetting a list

#quick challenge
list_rl1$UnknownHours[1]

#Proceeding 
list_rl1[1:3]
list_rl1[c(1,4)]
sublist1 <- list_rl1[c("Machine", "Stats")]
sublist1[[2]][2]
sublist1$Stats[2]
#single square brackets are for subsetting and double square brackets are for accessing elements 
# double square brackets are NOT for subsetting (allow accessing only single element)

#Plot 

library(ggplot2)
p <- ggplot(data=util)
p + geom_line(aes(x=PosixTime, y=Utilization, color=Machine), size=1.2)+ facet_grid(Machine ~.)+
  geom_hline(yintercept = 0.90, color="Grey", size=1.2, linetype = 3)
myplot <- p + geom_line(aes(x=PosixTime, y=Utilization, color=Machine), size=1.2)+ facet_grid(Machine ~.)+
  geom_hline(yintercept = 0.90, color="Grey", size=1.2, linetype = 3)

list_rl1$Plot <- myplot
list_rl1
summary(list_rl1)
str(list_rl1)
