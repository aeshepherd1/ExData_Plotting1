hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
plot1_dates <- c("1/2/2007", "2/2/2007")
df_plot1 <- hpc[hpc$Date == plot1_dates[1] | hpc$Date == plot1_dates[2],]

hist(df_plot1$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png") 
dev.off()