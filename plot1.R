plot1 <- function(dataFile = "household_power_consumption.txt") {
  ## plot1 assume data file is in the same directory 
  setwd("./")
  data <- read.csv(dataFile, sep=";", quote="",na.strings = "?",colClasses = c("character","character","numeric"))
  ## Convert Date Col to ISO Date format
  data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
  ## Select the Date Range
  DS <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]
  ## Draw the histogram to screen
  hist(as.numeric(DS$Global_active_power), col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  ## Save the histogram to PNG
  png(filename = "plot1.png",
      width = 480, height = 480, units = "px", pointsize = 12, type = "quartz", bg = "transparent")
  hist(as.numeric(DS$Global_active_power), col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}