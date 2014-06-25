library(pbtools)

datafile <- 'C:/Users/bouchalp/Downloads/GCI_data_platform_win.csv'
#gci <- read.csv(datafile)
#gci <- as.data.table(gci)
setkey(gci, 'Edition','Entity','Attribute','Series.unindented')
gci <- gci[grepl('20',gci$Edition),]
gci$Edition <- droplevels(gci$Edition)
table(gci$Edition)

countries <- c('United Kingdom','United States','Australia','New Zealand',
               'Singapore','Germany','Sweden','Finland','Canada','Netherlands')

gcif <- filter(gci, Entity %in% countries) %>%
  filter(Series.unindented=='1.A. Public institutions, 1-7 (best)') %>%
  filter(Attribute=='Score')
  
  
library(lattice)
xyplot(Value ~ Edition | Entity,data=gcif, type='b')

