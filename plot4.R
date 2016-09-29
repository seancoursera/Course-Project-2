# left join NEI and SCc to df, select coal related items to neicoal
df <- NEI %>% left_join((SCC %>% group_by(SCC)))
neicoal <- df[grep('Coal', as.character(df$EI.Sector), ignore.case = TRUE),]

sumcoal <- summarise(group_by(neicoal, year, EI.Sector), sum(Emissions))

plot4 <- ggplot(sumcoal, aes(year, `sum(Emissions)`))
plot4 + geom_bar(stat = 'identity') 

#output
dev.copy(png, 'plot4.png', height = 800, width = 800)
dev.off()