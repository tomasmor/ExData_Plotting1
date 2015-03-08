path <- "./Exdata_Plotting1/plots"
data_file <- "./ExData_Plotting1/data/household_power_consumption.txt"
if (!file.exists(path)){
  dir.create(path)
}

full_data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE,
                        dec=".", na.strings="?")
filtered_data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1 <- as.numeric(filtered_data$Sub_metering_1)
sub_metering_2 <- as.numeric(filtered_data$Sub_metering_2)
sub_metering_3 <- as.numeric(filtered_data$Sub_metering_3)
png('./ExData_Plotting1/plots/plot3.png')
plot(datetime, sub_metering_1,
     xlab = '', 
     ylab = 'Energy sub metering', 
     type = 'l', 
     col = 'black')

lines(datetime, sub_metering_2, col = 'red')
lines(datetime, sub_metering_3, col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"),cex=0.7, pt.cex = 1)

dev.off()