# Exploratory Data Analysis: Project #1

# IMPORTANT:
# Please download the zip file and store it in your working directory
# URL for zip file: "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Please unzip the file, you will have as data file "household_power_consumption.txt"

# load the data in memory:
house<-read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
         na.strings = "?", nrows = 2075259, check.names = FALSE, 
         stringsAsFactors = FALSE, comment.char = "", quote = '\"')

# convert Date column chr to R Date class 
house$Date <- as.Date(house$Date, format = "%d/%m/%Y")

# Subset the data
work <- subset(house, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(house)

# Add converted POSIX date / times (Datetime) column to work sheet
date_time <- paste(as.Date(work$Date), work$Time)
work$Datetime <- as.POSIXct(date_time)

# plot 4th to pgn file
png("plot4.png")

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(work,
     {plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power", xlab = "")
      plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
      plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
      lines(Sub_metering_2 ~ Datetime, col = 'Red')
      lines(Sub_metering_3 ~ Datetime, col = 'Blue')
      legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
      }
     )

dev.off()
