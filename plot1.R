# Construct the plot and save it to a PNG file with a width of 480 pixels and a 
# height of 480 pixels.
# Use data from 2007-02-01 and 2007-02-02

# Read in file
 df <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE,  
     na.strings = "?")

# convert date
 df$Date2 <- as.Date( as.character(df$Date), "%d/%m/%Y")

# get the subset of the data corresponding to the given dates
 sub.df = subset(df, as.Date(Date2) == '2007-02-01' | as.Date(Date2) == '2007-02-02' ) 

# set device to png plot
png (file = "plot1.png", width=480, height=480)

# make the histogram
hist(sub.df$Global_active_power,  xlab = "Global Active Power (kilowatts)", 
    main = "Global Active Power", col = "red")

# turn the device off
dev.off()
