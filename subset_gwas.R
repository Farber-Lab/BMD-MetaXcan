library(data.table)

data <- fread('Biobank2-British-Bmd-As-C-Gwas-SumStats.txt.gz', header=TRUE, na.strings='<CNO>')
bc <- data[,c('SNPID', 'CHR', 'BP', 'EA', 'NEA', 'BETA', 'SE')]

bc$EA <- as.character(bc$EA)
bc$NEA <- as.character(bc$NEA)
bc$CHR <- as.numeric(bc$CHR)
bc$BP <- as.numeric(bc$BP)
bc$BETA <- as.numeric(bc$BETA)
bc$SE <- as.numeric(bc$SE)
bc$CHR[bc$CHR==23] <- 'X'
print(table(bc$CHR))
print(str(bc))
write.table(bc, 'bmd_morris_short_clean2.txt', quote=FALSE, row.names = FALSE, sep='\t')
