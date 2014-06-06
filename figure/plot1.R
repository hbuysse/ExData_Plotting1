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

#histogram
hist(hpc$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col=c("red"))

#copy to png
dev.copy(png, file ="plot1.png", width = 480, height = 480, units = "px")
dev.off()



