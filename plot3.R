#Sum Emission by year and type
sumneibctype <- summarise(group_by(neibc, year, type), sum(Emissions))

plot3 <- ggplot(sumneibctype, aes(year, `sum(Emissions)`))

plot3 + geom_bar(stat = 'identity') + facet_grid(.~type)

#output
dev.copy(png, 'plot3.png', height = 800, width = 800)
dev.off()

