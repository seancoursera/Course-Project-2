#emissions from motor vehicle sources changed from 1999–2008 in Baltimore City
neibc <- df %>% filter(fips == '24510')
neibm <- neibc[grep('vehicles', neibc$SCC.Level.Two, ignore.case = TRUE),]


sumbm <- summarise(group_by(neibm, year, SCC.Level.Two), sum(Emissions))

plot5 <- ggplot(sumbm, aes(year, `sum(Emissions)`))
plot5 + geom_bar(stat = 'identity') 

#output
dev.copy(png, 'plot5.png', height = 800, width = 800)
dev.off()