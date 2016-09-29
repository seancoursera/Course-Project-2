#emissions from motor vehicle sources changed from 1999–2008 in Baltimore City
neibc <- df %>% filter(fips == '24510')
neibm <- neibc[grep('vehicles', neibc$SCC.Level.Two, ignore.case = TRUE),]
neibm$city <- 'BC'


#emissions from motor vehicle sources changed from 1999–2008 in Los Angeles
neila <- df %>% filter(fips == '06037')
neilam <- neila[grep('vehicles', neila$SCC.Level.Two, ignore.case = TRUE),]
neilam$city <- 'LA'

neiblam <- rbind(neibm, neilam)

sumblam <- summarise(group_by(neiblam, year, city), sum(Emissions))

plot6 <- ggplot(sumblam, aes(year, `sum(Emissions)`))
plot6 + geom_bar(stat = 'identity') + facet_grid(.~city)


#output
dev.copy(png, 'plot6.png', height = 800, width = 800)
dev.off() 