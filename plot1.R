#######PLOT 1 CONSTRUCTION#######

data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') #### READING FILE (THE .TXT FILE SHOULD BE IN YOUR WORKING DIRECTORY IN ORDER TO THIS CODE TO BE REPRODUCED)

head(data)


data_final<- subset(data, Date %in% c("1/2/2007","2/2/2007")) ###SUBSETTING ONLY THE PERIOD THAT MATTERS

###Constructing Plot 1. 

hist(data_final$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts")

### Saving Plot 1 to png. 

dev.copy(png, file = "plot1.png", height = 480, width = 480)

### returning to screen and finishing plot. 

dev.off()