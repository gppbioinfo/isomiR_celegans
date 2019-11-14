#############
# Written for isomiR project by Ganesh Panzade
# The code is used to plot two or three set venn diagram for isomiR/miR target gene count
# Usage: Rscript Two-threeset_vennDiagram.R cel-miR-71-5p_target.png
#############

library(VennDiagram)
#library("colorspace")
#hcl_palettes(plot = TRUE)
library(Cairo)

args = commandArgs(trailingOnly=TRUE) # output file name ex. cel-miR-50-5p_ttt.png
#grid.newpage()

#svg(file=args[1],width=250, height=185, units="px", pointsize=24, res=100)

Cairo(file=args[1], type="png", units="px", width=300, height=300, pointsize=24, dpi=72, bg="white")

# miR-63-3p

#venn.plot = draw.pairwise.venn(area1 = 848+179, area2 = 266+179, cross.area = 179, category = c("miR-63-3p", "isomiR"), lty = "solid", col=c("light blue", "light green"), fill = c("light blue", "light green"), alpha = rep(0.5, 2), cat.pos = c(0, 5), euler.d = T, scaled = F, sep.dist = 0.0,  rotation.degree = 0, inverted = F, cat.cex = .7, cex=.7, cat.dist=0.03, lwd=2, fontfamily="arial", cat.fantfamily="arial", fontface="bold", cat.fontface="bold")

# miR-71-5p

#venn.plot = draw.pairwise.venn(area1 = 1720+503, area2 = 487+503, cross.area = 503, category = c("miR-71-5p", "isomiR"), lty = "solid", col=c("light blue", "light green"), fill = c("light blue", "light green"), alpha = rep(.5, 2), cat.pos = c(4, 10), euler.d = T, scaled = F, sep.dist = 0.09,  rotation.degree = 0, inverted = F, cat.cex = .7, cex=.7, cat.dist=0.03, lwd=2, fontfamily="arial", cat.fantfamily="arial", fontface="bold", cat.fontface="bold")


# miR-229-3p

#venn.plot = draw.pairwise.venn(area1 = 446+535, area2 = 1317+535, cross.area = 535, category = c("miR-229-3p", "isomiR"), lty = "solid", col=c("light blue", "light green"), fill = c("light blue", "light green"), alpha = rep(.5, 2), cat.pos = c(10, 10), euler.d = F, scaled = F, sep.dist = 0.03,  rotation.degree = 0, inverted = F, cat.cex = .7, cex=.7, cat.dist=0.03, lwd=2, fontfamily="arial", cat.fantfamily="arial", fontface="bold", cat.fontface="bold")

# miR-246-3p

#venn.plot = draw.pairwise.venn(area1 = 493+244, area2 = 429+244, cross.area = 244, category = c("miR-246-3p", "isomiR"), lty = "solid", col=c("light blue", "light green"), fill = c("light blue", "light green"), alpha = rep(.5, 2), cat.pos = c(0, 10), euler.d = T, scaled = F, sep.dist = 0.03,  rotation.degree = 0, inverted = F, cat.cex = .7, cex=.7, cat.dist=0.03, lwd=2, fontfamily="arial", cat.fantfamily="arial", fontface="bold", cat.fontface="bold")

# miR-248

#venn.plot = draw.pairwise.venn(area1 = 287+227, area2 = 333+227, cross.area = 227, category = c("miR-248", "isomiR"), lty = "solid", col=c("light blue", "light green"), fill = c("light blue", "light green"), alpha = rep(.5, 2), cat.pos = c(0, 10), euler.d = T, scaled = F, sep.dist = 0.03,  rotation.degree = 0, inverted = F, cat.cex = .7, cex=.7, cat.dist=0.03, lwd=2, fontfamily="arial", cat.fantfamily="arial", fontface="bold", cat.fontface="bold")

# miR-1820-5p

#venn.plot = draw.pairwise.venn(area1 =846+847 , area2 = 823+847, cross.area = 847, category = c("miR-1820-5p", "isomiR"), lty = "solid", col=c("light blue", "light green"), fill = c("light blue", "light green"), alpha = rep(.5, 2), cat.pos = c(10, 10), euler.d = T, scaled = F, sep.dist = 0.03,  rotation.degree = 0, inverted = T, cat.cex = .7, cex=.7, cat.dist=0.03, lwd=2, fontfamily="arial", cat.fantfamily="arial", fontface="bold", cat.fontface="bold")

# miR-50-5p

venn.plot = draw.triple.venn(area1=727, area2=956, area3=1141, n12=139+85, n23=90+85, n13=217+85, n123=85, category =c("miR-50-5p", "isomiR_AUAUGUC", "isomiR_UGAUAUG"), rotation = 1, reverse = FALSE, euler.d =TRUE, scaled = F, lwd = rep(1, 3), lty =rep("solid", 3), fill = c("light blue", "orange", "light green"), col =c("light blue", "orange", "light green"), alpha = rep(0.5, 3), label.col = rep("black", 7), cex= rep(.6, 7), fontface = "bold", fontfamily ="arial", cat.pos = c(-40, 50, 180), cat.dist =c(0.06, 0.05, 0.025), cat.col= rep("black", 1),cat.cex = rep(.6, 3), cat.fontface = "bold", cat.fontfamily = "arial", cat.just =list(c(.1, .6), c(.9, 0.1), c(0.5, .4)), cat.default.pos= "outer", cat.prompts = FALSE,rotation.degree = 0, rotation.centre = c(0.5, 0.5), ind = T, sep.dist = 0.01, offset = 0, cex.prop = NULL,  area.vector = 0)

# miR-233-3p 

#venn.plot = draw.triple.venn(area1=834, area2=1022, area3=840, n12=217+232, n23=217+33, n13=217+156, n123=217, category =c("miR-233-3p", "isomiR_GAGCAAU", "isomiR_UUGAGCA"), rotation = 1, reverse = FALSE, euler.d =TRUE, scaled = F, lwd = rep(2, 3), lty =rep("solid", 3), fill = c("light blue", "orange", "light green"), col =c("light blue", "orange", "light green"), alpha = rep(0.5, 3), label.col = rep("black", 7), cex= rep(.6, 7), fontface = "bold", fontfamily ="arial", cat.pos = c(-30, 40, 180), cat.dist =c(0.06, 0.05, 0.025), cat.col= rep("black", 3),cat.cex = rep(.58, 3), cat.fontface = "bold", cat.fontfamily = "arial", cat.just =list(c(.1, .6), c(.9, 0.1), c(0.5, .4)), cat.default.pos= "outer", cat.prompts = FALSE,rotation.degree = 0, rotation.centre = c(0.5, 0.5), ind = T, sep.dist = 0.01, offset = 1, cex.prop = NULL,  area.vector = 0)

# miR-240-3p

#venn.plot = draw.triple.venn(area1=183, area2=449, area3=264, n12=13+8, n23=13+89, n13=13+32, n123=13, category =c("miR-240-3p", "isomiR_AUACUGG", "isomiR_UACUGGC"), rotation = 1, reverse = FALSE, euler.d =TRUE, scaled = F, lwd = rep(2, 3), lty =rep("solid", 3), fill = c("light blue", "orange", "light green"), col =c("light blue", "orange", "light green"), alpha = rep(0.5, 3), label.col = rep("black", 7), cex= rep(.8, 7), fontface = "bold", fontfamily ="arial", cat.pos = c(-40, 50, 180), cat.dist =c(0.06, 0.05, 0.025), cat.col= rep("black", 3),cat.cex = rep(.58, 3), cat.fontface = "bold", cat.fontfamily = "arial", cat.just =list(c(.1, .6), c(.9, 0.1), c(0.5, .4)), cat.default.pos= "outer", cat.prompts = FALSE,rotation.degree = 0, rotation.centre = c(0.5, 0.5), ind = T, sep.dist = 0.01, offset = 1, cex.prop = NULL,  area.vector = 0)

grid.draw(venn.plot)

dev.off()


 
 
