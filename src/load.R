library(pbtools)

datafile <- 'C:/Users/bouchalp/Downloads/GCI_data_platform_win.csv'
gci <- read.csv(datafile)
gci <- as.data.table(gci)
setkey(gci, 'Edition','Entity','Attribute','Series.unindented')
gci <- gci[grepl('20',gci$Edition),]
gci$Edition <- droplevels(gci$Edition)
table(gci$Edition)


