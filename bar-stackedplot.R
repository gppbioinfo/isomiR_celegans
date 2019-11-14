#############
# Written for isomiR project by Ganesh Panzade
# The code is used to plot read distribution and total abundance graph for isomiR/miRNA
# Usage: Rscript bar-statckedplot.R cel-miR-71-5p_isomiR.txt cel-miR-71-5p_miR.txt
#############

library(ggplot2)
library(reshape2)
library(gtable)
library(grid)
library(scales)
library(knitr)


args = commandArgs(trailingOnly=TRUE)  # Arguement as inputfile in tab separated format with isomiR/miR/total RPM score

outpng = gsub("_rbar.txt","",args[1])
#outpng1 = gsub("_rbar.txt"," (*)",args[1])
outfile=paste(outpng, ".png", sep="")

# Stage	Type	RPM

xa1 = read.table(args[1], header = T, sep = "\t")
#head(xa1)

# tage	Type	Reads

f2 = read.table(args[2], header = T, sep = "\t")
#colnames(f2) = c("Stage","Type","RPM")
#head(f2,2)

			   
				   
				   
				   
				   


##colnames(dt2) = c ("Groupoint", "Gp", "datap")

png(file=outfile,width=450, height=305, units="px", pointsize=24, res=200)

xa1$Stage=factor(xa1$Stage, levels = unique(xa1$Stage))
f2$Stage=factor(f2$Stage, levels = unique(f2$Stage))

grid.newpage()


p1 <- ggplot(xa1, aes(y=RPM, x=Stage, fill=Type)) + geom_bar(position = "fill", stat="identity") + theme_bw() + scale_fill_manual(values = c("#E69F00", "#56B4E9")) + geom_text(aes(y = 0, label=Stage), angle = 90, hjust = -.05, family="arial bold", size=3, color="black") + theme(axis.ticks.x=element_blank()) + theme(panel.grid.major.x = element_blank()) + theme(panel.grid.major.y = element_blank()) + ylab("Read distribution") + theme(axis.title.y = element_text(size = 8, colour = "black", face="bold")) + theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + theme(axis.text.x=element_blank()) + ggtitle(outpng) + theme(plot.title = element_text(hjust=0.5, face = "bold", size=10)) + scale_y_continuous(labels = scales::percent) + theme(legend.position = "none") + theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + xlab("") + theme(axis.title.y=element_blank())


if(max(f2$Reads) > 1500) {

ks <- function (x) { number_format(accuracy = .1,
                                   scale = 1/1000,
                                   suffix = "k",
                                   big.mark = ",")(x) } 
p2 = ggplot(data=f2, aes(x=Stage, y=Reads, group=1)) + geom_line(color="#D55E00", size=.8) + geom_point(aes(color="#D55E00"))+ theme(panel.grid.major.x = element_blank()) + theme(panel.grid.major.y = element_blank()) + xlab("Samples") + ylab("Total RPM") + theme_bw() + theme(axis.title.y=element_text(angle = -90)) + theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + theme(axis.title.y = element_text(size = 8, colour = "black", face="bold")) + theme(panel.background = element_rect(fill = NA)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank()) + scale_y_continuous(labels = ks) + theme(axis.title.y=element_blank())

} else {


p2 = ggplot(data=f2, aes(x=Stage, y=Reads, group=1)) + geom_line(color="#D55E00", size=.8) + geom_point(aes(color="#D55E00"))+ theme(panel.grid.major.x = element_blank()) + theme(panel.grid.major.y = element_blank()) + xlab("Samples") + ylab("Total RPM") + theme_bw() + theme(axis.title.y=element_text(angle = -90)) + theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + theme(axis.title.y = element_text(size = 8, colour = "black", face="bold")) + theme(panel.background = element_rect(fill = NA)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank()) + ylim(min(f2$Reads), max(f2$Reads)) + theme(axis.title.y=element_blank()) #+ scale_y_continuous(labels = ks) + 

}



# extract gtable
g1 <- ggplot_gtable(ggplot_build(p1))
g2 <- ggplot_gtable(ggplot_build(p2))

# overlap the panel of 2nd plot on that of 1st plot
pp <- c(subset(g1$layout, name == "panel", se = t:r))
g <- gtable_add_grob(g1,g2$grobs[[which(g2$layout$name == "panel")]], pp$t, pp$l, pp$b, pp$l)

alab <- g2$grobs[[which(g2$layout$name=="ylab-l")]]
ia <- which(g2$layout$name == "axis-l")
ga <- g2$grobs[[ia]]
ax <- ga$children[[2]]
ax$widths <- rev(ax$widths)
ax$grobs <- rev(ax$grobs)
ax$grobs[[1]]$x <- ax$grobs[[1]]$x - unit(1, "npc") + unit(0.15, "cm")
g <- gtable_add_cols(g, g2$widths[g2$layout[ia, ]$l], length(g$widths) - 1 )
g <- gtable_add_cols(g, g2$widths[g2$layout[ia, ]$l], length(g$widths) - 1 )
g <- gtable_add_grob(g, ax, pp$t, length(g$widths) - 2, pp$b)
g <- gtable_add_grob(g, alab, pp$t, length(g$widths) - 1, pp$b)

grid.draw(g)



















#tiff(file=outfile, width = 10, height = 8, units = 'in', res = 300)


#ggplot(dt2, aes(fill=Groupoint, y=datap, x=factor(Gp))) + geom_bar(position="fill", stat="identity") + theme_minimal() + geom_text(aes(y = 0, label=Gp), angle = 90, hjust = -.05, face="bold", family="arial", size=3, color="black") + theme(axis.ticks.x=element_blank())  + theme(panel.grid.major.x = element_blank()) + scale_y_continuous(labels = scales::percent) +  ylab("Read distribution (RPM)") + theme(axis.title.y = element_text(size = 10, colour = "black", face="bold")) + theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + ggtitle(outpng) + theme(plot.title = element_text(hjust=0.5, face = "bold")) + theme(axis.text.x=element_blank()) + theme(legend.position = "bottom") + theme(legend.text=element_text(size=1,face="bold", family="aerial black")) + theme(legend.title=element_text())+ theme(legend.title = element_blank()) + theme(legend.position = "bottom", legend.justification = c(0,1), legend.box.margin = margin(c(-30,0,15,15))) + xlab("")


##ggplot(dt2, aes(fill=Groupoint, y=datap, x=factor(Gp))) + geom_bar(position="fill", stat="identity") + theme_minimal() + geom_text(aes(y = 0, label=Gp), angle = 90, hjust = -.05, face="bold", family="arial", size=6, color="black") + theme(axis.ticks.x=element_blank())  + theme(panel.grid.major.x = element_blank())  +  theme(legend.text=element_text(size=8,face="bold", family="aerial black"))  + ylab("Read distribution (RPM)") + theme(axis.title.y = element_text(size = 12, colour = "black", face="bold")) + theme(axis.text.y = element_text(size = 12, colour = "black", face="bold")) +  theme(axis.text.x=element_blank()) + ggtitle(outpng) + theme(plot.title = element_text(hjust=0.5, face = "bold", size=10)) + theme(legend.position = "bottom") + theme(legend.title = element_blank()) + theme(legend.position = "bottom", legend.justification = c(0,1), legend.box.margin = margin(c(-30,0,15,15))) + xlab("") +theme(legend.key.size = unit(.5,"line"))

dev.off()


