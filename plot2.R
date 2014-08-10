# Construct the plot and save it to a PNG file with a width of 480 pixels and a 
# height of 480 pixels.
# Use data from 2007-02-01 and 2007-02-02 in the file household_power_consumption.txt

# Read in file
 df <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE,  na.strings = "?")

# Get Date and Time and convert to POSIX standard
 df$Date2 <- as.Date( as.character(df$Date), "%d/%m/%Y")
 df$Time2 <- strptime( as.character(df$Date), "%d/%m/%Y")
 df$Date3 <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
 df$Weekday <- weekdays(as.Date(df$Date2))

# extract the subset of the data based on given dates
 sub <- subset(df, as.Date(Date2) == '2007-02-01' | as.Date(Date2) == '2007-02-02' ) 

# set device to png plot
png (file = "plot2.png", width=480, height=480)

# plot data
 plot ( sub$Date3, sub$Global_active_power, ylab = "Global Active Power (kilowatts)",      
    xlab = "", main = "", type = "l")

# turn of plotting device
 dev.off()
