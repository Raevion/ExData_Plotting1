# Loading the data, taking the subset
data <- read.table("household_power_consumption.txt",skip=1,sep=";",na.strings = "?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- subset(data, Date=="1/2/2007" |  Date =="2/2/2007")
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
Datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- strptime(Datetime,format = "%Y-%m-%d %H:%M:%S")

## Plot
png(filename = "plot2.png", width=480, height=480, units = "px")
with(subdata, plot(Datetime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()