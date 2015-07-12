## Assignment Project plot4.R

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

## Convert all Sub_metering to numbers
dt$Sub_metering_1 <- (as.numeric(as.character(dt$Sub_metering_1)))
dt$Sub_metering_2 <- (as.numeric(as.character(dt$Sub_metering_2)))
dt$Sub_metering_3 <- (as.numeric(as.character(dt$Sub_metering_3)))

## create a datetime object 
dt$dt <- strptime(dt$Datetime, '%d/%m/%Y %H:%M') 

## plot 4
par(mfrow=c(2,2))
plot(dt$dt,dt$Global_active_power,ylab='Global Active Power',xlab='',type='line')
plot(dt$dt,dt$Voltage,ylab='Voltage',xlab='datetime',type='line')
plot(dt$dt,dt$Sub_metering_1,ylab='Energy Sub Metering',xlab='',type='line')
lines(dt$dt,dt$Sub_metering_2,col='red')
lines(dt$dt,dt$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1     ','Sub_metering_2    ','Sub_metering_3   '), col=c('black','red','blue'), bty="n",lty=1,lwd=1.5,xjust=1,yjust=0.5,y.intersp=0.6)
plot(dt$dt,dt$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='line')
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()