#read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

sumnei <- summarise(group_by(NEI, year), sum(Emissions))

barplot(
  (sumnei$'sum(Emissions)'),
  names.arg=sumnei$year,
  xlab = 'Year',
  ylab = 'PM 2.5 Emissions',
  main= 'Total emissions from PM2.5 decreased in the United States from 1999 to 2008')

#output
dev.copy(png, 'plot1.png', height = 800, width = 800)
dev.off()
















