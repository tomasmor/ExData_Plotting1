# downloading and extracting the data file if it not exists

url <- 'https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip'

data_file <- "./ExData_Plotting1/data/household_power_consumption.txt"

if (!file.exists("./ExData_Plotting1/data/household_power_consumption.txt")){
  dir.create("./Exdata_Plotting1")
  dir.create("./Exdata_Plotting1/data")
  download.file(url, './ExData_Plotting1/data/household_power_consumption.zip', method="curl")
  unzip('./ExData_Plotting1/data/household_power_consumption.zip', exdir = './ExData_Plotting1/data')
}

# reading full data and filter it
names <- names(read.table(data_file, nrows=1, header=TRUE, sep=";"))
full_data <- read.table(data_file, sep=";", col.names=names, na.strings="?", header=TRUE,
                        nrows=2075259)
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

filtered_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)
datetime <- strptime(paste(filtered_data$Date, filtered_data$Time), format = '%d/%m/%Y %H:%M:%S')
res <- cbind(datetime, filtered_data[, 3:9])
