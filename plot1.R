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

# plot first to pgn file
png("plot1.png")
hist(work$Global_active_power, col = "red",
            main = paste("Global Active Power"),
            xlab = "Global Active Power (kilowatts)")
dev.off()
