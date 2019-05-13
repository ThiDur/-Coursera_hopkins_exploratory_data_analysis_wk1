library(tidyverse)

tbl_power_consumption <- read_csv2(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), na=c("", "NA", "?"), col_types=list(col_date(format='%d/%m/%Y'), col_time(), col_number(), col_number(), col_number(), col_number(), col_number(), col_number(), col_number()))
tbl_power_consumption <- filter(tbl_power_consumption, Date=='2007-02-01' | Date=='2007-02-02')
tbl_power_consumption <- mutate(tbl_power_consumption, datetime=as.POSIXct(paste(Date, " ", Time)))

with(tbl_power_consumption, plot(datetime, Global_active_power/1000, type='l', xlab='', ylab='Global Active Power (kilowats)'))
dev.copy(png, file='plot2.png', width=480, height=480)
dev.off()