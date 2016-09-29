#Baltimore City
neibc <- filter(NEI, fips == "24510")

sumneibc <- summarise(group_by(neibc, year), sum(Emissions))

barplot(
  (sumneibc$'sum(Emissions)'),
  names.arg=sumneibc$year,
  xlab = 'Year',
  ylab = 'PM 2.5 Emissions',
  main= 'Total emissions from PM2.5 decreased in Baltimore City from 1999 to 2008')

#output
dev.copy(png, 'plot2.png', height = 800, width = 800)
dev.off()