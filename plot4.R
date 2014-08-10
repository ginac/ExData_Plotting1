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
png (file = "plot4.png", width=480, height=480)

# Set up 2 by 2 plot
par( mfrow = c( 2, 2 ) )

# plot data 1

 plot ( sub$Date3, sub$Global_active_power, ylab = "Global Active Power ",
    xlab = "", main = "", type = "l")

# plot data 2
 plot ( sub$Date3, sub$Voltage, ylab = "Voltage",
    xlab = "datetime", main = "", type = "l")

# plot data 3
 plot ( sub$Date3, sub$Sub_metering_1, ylab = "Energy sub metering",      
    xlab = "", main = "", type = "l", col = "black" )
 lines ( sub$Date3, sub$Sub_metering_2, col = "red")
 lines ( sub$Date3, sub$Sub_metering_3, col = "blue")

# add legend
 legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,
                    col=c("black", "red", "blue"))
# plot data 4

 plot ( sub$Date3, sub$Global_reactive_power, ylab = "Global_reactive_power",
    xlab = "datetime", main = "", type = "l")

# turn of plotting device
 dev.off()
