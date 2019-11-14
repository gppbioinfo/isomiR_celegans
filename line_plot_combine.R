#############
# Written for isomiR project by Ganesh Panzade
# The code is used to plot normalize expression graph for isomiR/miRNA
# Usage: Rscript line_plot_combine.R cel-miR-71-5p_isomiR.txt cel-miR-71-5p_miR.txt
#############


library(ggplot2)
library(grid)
library(gridExtra)
#library(ggdenro)
library(ggsci)
library(plyr)
library(scales)
library(knitr)

args = commandArgs(trailingOnly=TRUE)

outpng = gsub("_isomiR.txt","",args[1])
outpng2 = gsub("_isomiR.txt","",args[1])
outpng1 = gsub("_miR.txt"," (miR)",args[2])
outfile=paste(outpng, "_combine_wtlog.png", sep="")
#outfile1=paste(outpng1, "_miR.png", sep="")

#outpng

# Stage	Type	RPM

ttt = read.table(args[1], header = F, sep = "\t")
#ttt

ttt2 = ddply(ttt, "V1", numcolwise(sum))
#ttt2

ttt3 = ttt2[order(-ttt2[,2]),]
if(nrow(ttt3) >= 5)
{
ttt3 = head(ttt3,3)
} else
{ 
ttt3 =  head(ttt3,2)
}
#head(ttt3,5)
ttt4 = merge(ttt, ttt3, by.x = "V1", by.y = "V1", all = F)

ttt4 = ttt4[,1:3]

#ttt4

colnames(ttt4) = c("V1","V2","V3")
ttt4$V1 = factor(ttt4$V1, unique(ttt4$V1), ordered=F)
ttt1 = read.table(args[2], header = F, sep = "\t")


#ttt1[1:nrow(ttt1),1]
#ttt1$V1 = sub("$", ".0", ttt1$V1)

#head(ttt1,10)

ttt4$V1 = gsub("cel-miR-\\d+-\\d\\w|cel-miR-\\d+", "isomiR", ttt4$V1)

tttwo = rbind(ttt1,ttt4)

colnames(tttwo) = c("isomiR", "Stage", "RPM")

#tttwo

#tttwo

#tttwo[,3] = scale(tttwo[,3])
#tttwo[,3] = log10(tttwo[,3])

#tttwo$isomiR = factor(tttwo$isomiR, unique(tttwo$isomiR))
tttwo$Stage = factor(tttwo$Stage, unique(tttwo$Stage))
tttwo$isomiR = gsub("cel-", "", tttwo$isomiR)
tttwo$isomiR = factor(tttwo$isomiR, unique(tttwo$isomiR))


png(file=outfile,width=800, height=600, units="px", pointsize=24, res=200)



if(max(tttwo$RPM) > 1000) {
ks <- function (x) { number_format(accuracy = 0.1,
                                   scale = 1/1000,
                                   suffix = "k",
                                   big.mark = ",")(x) } 

ggplot(tttwo, aes(x=Stage, y=RPM, group=isomiR)) + geom_line(aes(linetype=isomiR, color=isomiR), size=1.2) +  theme_bw() + theme(legend.title = element_blank()) + geom_point(aes(color=isomiR))+ theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + theme(axis.title.y = element_text(size = 10, colour = "black", face="bold")) + theme(axis.text.x = element_text(size = 8, colour = "black", face="bold", angle=35, vjust=1, hjust=1)) + theme(axis.title.x = element_text(size = 10, colour = "black", face="bold")) + ggtitle(outpng) + theme(plot.title = element_text(hjust=0.5, face = "bold", size=10)) + theme(legend.position = "right", legend.justification = c(0,1), legend.box.margin = margin(c(-5,0,0,-10))) + theme(legend.key.size = unit(.5,"line")) + theme(legend.text=element_text(size=6,face="bold", family="aerial black")) + theme(axis.title.x=element_blank(), axis.title.y=element_blank()) + scale_y_continuous(labels = ks) 

} else {				   
				    
ggplot(tttwo, aes(x=Stage, y=RPM, group=isomiR)) + geom_line(aes(linetype=isomiR, color=isomiR), size=1.2) +  theme_bw() + theme(legend.title = element_blank()) + geom_point(aes(color=isomiR))+ theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + theme(axis.title.y = element_text(size = 10, colour = "black", face="bold")) + theme(axis.text.x = element_text(size = 8, colour = "black", face="bold", angle=35, vjust=1, hjust=1)) + theme(axis.title.x = element_text(size = 10, colour = "black", face="bold")) + ggtitle(outpng) + theme(plot.title = element_text(hjust=0.5, face = "bold", size=10)) + theme(legend.position = "right", legend.justification = c(0,1), legend.box.margin = margin(c(-5,0,0,-10))) + theme(legend.key.size = unit(.5,"line")) + theme(legend.text=element_text(size=6,face="bold", family="aerial black")) + theme(axis.title.x=element_blank(), axis.title.y=element_blank())

}
dev.off()

