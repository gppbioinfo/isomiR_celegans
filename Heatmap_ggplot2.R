#############
# Written for isomiR project by Ganesh Panzade
# The code is used to plot normalize expression graph for isomiR/miRNA
# Usage: Rscript Heatmap_ggplot2.R cel-miR-71-5p_isomiR.txt cel-miR-71-5p_miR.txt
#############

library(ggplot2)
library(grid)
library(gridExtra)
#library(ggdenro)
library(ggsci)


args = commandArgs(trailingOnly=TRUE)

outpng = gsub("_isomiR.txt","",args[1])
outpng2 = gsub("_isomiR.txt"," (isomiR)",args[1])
outpng1 = gsub("_miR.txt"," (miR)",args[2])
outfile=paste(outpng, "_heatmap_new.png", sep="")
#outfile1=paste(outpng1, "_miR.png", sep="")

#outpng

# Stage	Type	RPM

ttt = read.table(args[1], header = F, sep = "\t")
ttt1 = read.table(args[2], header = F, sep = "\t")
ttt1[1:nrow(ttt1),1]
#ttt1$V1 = sub("$", ".0", ttt1$V1)
#head(ttt1,10)

tttwo = rbind(ttt1,ttt)

colnames(tttwo) = c("isomiR", "Stage", "RPM")

#tttwo[,3] = scale(tttwo[,3])
tttwo[,3] = log10(tttwo[,3])
tttwo$isomiR = factor(tttwo$isomiR, unique(tttwo$isomiR))
tttwo$Stage = factor(tttwo$Stage, unique(tttwo$Stage))


png(file=outfile,width=800, height=700, units="px", pointsize=24, res=200)


ggplot(data=tttwo, aes(x=Stage, y=isomiR)) + geom_tile(aes(fill=RPM)) + theme_minimal() + scale_fill_viridis_c() + theme(axis.text.y=element_text(size=6)) + ggtitle(outpng) + theme(plot.title = element_text(hjust=0.5, face = "bold", size=10)) + theme(axis.title.x=element_blank(), axis.text.x = element_text(face="bold", angle=45, hjust=1, size=10), axis.title.y = element_text(face="bold"), axis.text.y = element_text(face="bold", size=10), legend.title = element_text(face="bold", size=10) , legend.text = element_text(face="bold", size=8), legend.key.size=unit(.5, "line")) + labs(fill="RPM (K)") + scale_y_discrete(name="", limits = rev(levels(tttwo$isomiR)))

#ggplot(data=tttwo, aes(x=Stage, y=isomiR)) + geom_tile(aes(fill=RPM)) + theme_minimal() + scale_fill_viridis_c() + theme(axis.text.y=element_text(size=6)) + ggtitle(outpng) + theme(plot.title = element_text(hjust=0.5, face = "bold", size=10)) + theme(axis.title.x=element_blank(), axis.text.x = element_text(face="bold", angle=45, hjust=1, size=10), axis.title.y = element_text(face="bold"), axis.text.y = element_blank(), legend.title = element_text(face="bold", size=10) , legend.text = element_text(face="bold", size=8), legend.key.size=unit(.5, "line")) + labs(fill="RPM (K)") + scale_y_discrete(name="", limits = rev(levels(tttwo$isomiR))) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())


dev.off()

