# set working directory
setwd("C:/Heidi/Coursera/EDA")

#import dataset
household_power_consumption <- read.csv("C:/Heidi/Coursera/EDA/household_power_consumption.txt", sep=";", na.strings="?")

#set Data and Time as such values
household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time),format="%d/%m/%Y %H:%M:%S")
household_power_consumption$Datum <- strptime(paste(household_power_consumption$Date),format="%d/%m/%Y")
household_power_consumption$Tijd <- strptime(paste(household_power_consumption$Time),format="%H:%M:%S")

# look at data.
View(household_power_consumption)

#select the subset based on date=2007-02-02 or date=2007-02-02
hpc <-  subset(household_power_consumption, as.Date(Datum) =="2007-02-01" | as.Date(Datum) =="2007-02-02")


#Plot 3
op <- par(cex=.64)
plot(hpc$DateTime, hpc$Sub_metering_1, type="n",xlab="Days", ylab="Energy sub metering", col="green") 
lines(hpc$DateTime, hpc$Sub_metering_1,col="blue",lwd=2.5)
par(new=TRUE)
lines(hpc$DateTime, hpc$Sub_metering_2,,col="red",lwd=2.5)
lines(hpc$DateTime, hpc$Sub_metering_3,,col="green",lwd=2.5)

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("blue","red","green"), text.font=1,pch=1, pt.cex = 0.8)

par(op)

#copy to png
dev.copy(png, file ="plot3.png", width = 480, height = 480, units = "px")
dev.off()

