path <- "./ExData_Plotting1/plots"
if (!file.exists(path)){
  dir.create(path)
}
data_file <- "./ExData_Plotting1/data/household_power_consumption.txt"
if (!file.exists(data_file)){
  source("./ExData_Plotting1/script/getting_data.R")
}
full_data <- read.table(data_file, header=TRUE, sep=";", 
                        stringsAsFactors=FALSE, dec=".", na.strings="?")
filtered_data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]


hist(filtered_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="./ExData_Plotting1/plots/plot1.png", height=480, width=480)
dev.off()