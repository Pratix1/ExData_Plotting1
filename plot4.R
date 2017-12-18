#######PLOT 4 CONSTRUCTION#######

data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') #### READING FILE (THE .TXT FILE SHOULD BE IN YOUR WORKING DIRECTORY IN ORDER TO THIS CODE TO BE REPRODUCED)

head(data)


data_final<- subset(data, Date %in% c("1/2/2007","2/2/2007")) ###SUBSETTING ONLY THE PERIOD THAT MATTERS

Sys.setlocale(category = "LC_ALL", locale = "english") ### setting it to english. If not, days would appear in spanish

data_final$Date <- as.Date(data_final$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_final$Date), data_final$Time)
data_final$Datetime <- as.POSIXct(datetime)

###modifying how the plots are going to appear (2 by 2), the margins and outer margins. Then i just create the 4 plots

par(mfrow = c(2, 2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data_final, {
        plot (Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power", xlab ="")
        plot (Voltage ~ Datetime, type ="l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = "red")
        lines(Sub_metering_3 ~ Datetime, col = "blue")
        legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        plot (Global_reactive_power ~ Datetime, type = "l", xlab = "")
})

### Saving Plot 2 to png. 

dev.copy(png, file = "plot4.png", height = 480, width = 480)

### returning to screen and finishing plot.

dev.off()

