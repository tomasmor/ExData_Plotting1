path <- "./Exdata_Plotting1/plots"
data_file <- "./ExData_Plotting1/data/household_power_consumption.txt"
if (!file.exists(path)){
  dir.create(path)
}

full_data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE,
                        dec=".", na.strings="?")
filtered_data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(filtered_data$Global_active_power)

plot(datetime, Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./Exdata_Plotting1/plots/plot2.png", height=480, width=480)
dev.off()