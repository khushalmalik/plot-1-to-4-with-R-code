## Assignment Project plot1.R

## setting up working directory
setwd("~/Desktop")

## read the textfile having ; as separator
dt=read.csv('household_power_consumption.txt',header=T, sep=';') 

## merging date and time as one column of continuous string of character variables
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])

## convert the Date column's datatype from string to date 
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') 

##select only the two required days
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') 

## convert the Global Active Power's datatype from text to numbers
dt[,3] = as.numeric(as.character(dt[,3])) 

## plot 1
png('plot1.png',width=480,height=480)
hist(dt[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()