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
global_active_power <- as.numeric(filtered_data$Global_active_power)
global_reactive_power <- as.numeric(filtered_data$Global_reactive_power)
voltage <- as.numeric(filtered_data$Voltage)

png("./Exdata_Plotting1/plots/plot4.png", width=480, height=480)
par(mfcol = c(2, 2)) 

plot(datetime, 
# top left
     global_active_power, 
     xlab = '', 
     ylab = 'Global Active Power', 
     type = 'l')

# bottom left
plot(datetime, 
     sub_metering_1, 
     xlab = '', 
     ylab = 'Energy sub metering', 
     type = 'l', 
     col = 'black')

lines(datetime, 
      sub_metering_2, 
      col = 'red')

lines(datetime, 
      sub_metering_3, 
      col = 'blue')

legend('topright', 
       bty = 'n', 
       tail(names(res), 3), 
       lty = 1, 
       col = c('black', 'red', 'blue'))

#no.3 plot - top right
plot(datetime, 
     voltage, 
     xlab = 'datetime', 
     ylab = 'Voltage', 
     type = 'l')

#no.4 plot - bottom right
plot(datetime, 
     global_reactive_power, 
     xlab = 'datetime', 
     ylab = 'Global_reactive_power', 
     type = 'l')
dev.off()