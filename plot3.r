library(tidyverse)

tbl_power_consumption <- read_csv2(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), na=c("", "NA", "?"), col_types=list(col_date(format='%d/%m/%Y'), col_time(), col_number(), col_number(), col_number(), col_number(), col_number(), col_number(), col_number()))
tbl_power_consumption <- filter(tbl_power_consumption, Date=='2007-02-01' | Date=='2007-02-02')
tbl_power_consumption <- mutate(tbl_power_consumption, datetime=as.POSIXct(paste(Date, " ", Time)))

with(tbl_power_consumption, plot(datetime, Sub_metering_1/1000, type='l', xlab='', ylab='Energy sub metering'))
with(tbl_power_consumption, lines(datetime, Sub_metering_2/1000, col='red'))
with(tbl_power_consumption, lines(datetime, Sub_metering_3/1000, col='blue'))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1,1))
dev.copy(png, file='plot3.png', width=480, height=480)
dev.off()