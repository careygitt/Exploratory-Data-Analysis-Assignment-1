unzip(zipfile = "exdata_data_household_power_consumption")
data_full <- read.csv("household_power_consumption.txt", header = TRUE,sep = ";",
                      na.strings = "?", nrows = 2075259, check.names = FALSE, 
                      sttingAsFactors = FALSE, comment.char = "", quote = '\"')
data1 <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d%m%Y")

hist(data1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active, Power (Kilowatt)", ylab = "Frequency", col = "Red")
png("plot1.png", width = 480, height = 480)
dev.off