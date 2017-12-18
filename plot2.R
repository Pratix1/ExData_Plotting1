#######PLOT 2 CONSTRUCTION#######

data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') #### READING FILE (THE .TXT FILE SHOULD BE IN YOUR WORKING DIRECTORY IN ORDER TO THIS CODE TO BE REPRODUCED)

head(data)


data_final<- subset(data, Date %in% c("1/2/2007","2/2/2007")) ###SUBSETTING ONLY THE PERIOD THAT MATTERS

Sys.setlocale(category = "LC_ALL", locale = "english") ### setting it to english. If not, days would appear in spanish

data_final$Date <- as.Date(data_final$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_final$Date), data_final$Time)
data_final$Datetime <- as.POSIXct(datetime)

###Constructing Plot 2. 

with(data_final, plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab =""))

### Saving Plot 2 to png. 

dev.copy(png, file = "plot2.png", height = 480, width = 480)

### returning to screen and finishing plot.

dev.off()