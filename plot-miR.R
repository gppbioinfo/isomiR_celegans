#############
# Written for isomiR project by Ganesh Panzade
# The code is used to separated and construct a matrix of isomiR/miR/Total RPM for indidual miRNA
# Usage: Rscript plot-miR.R isomiR_miR_rpm.txt
#############



library(ggplot2)
args = commandArgs(trailingOnly=TRUE)

system("mkdir new_plots1")
#nt = read.table("isomiR-SEA-output_for_unique_tag_rpm.csv", header = T, sep = "\t", row.names = 1)
#nt = read.table("isomiR-SEA-output_for_unique_tag_rpm.csv", header = T, sep = "\t", row.names = 1)

nt = read.table(args[1], header = T, sep = "\t", row.names = 1)
head(nt)

#nt = read.table("overlap_both_tools300719_strandinfo_ranked.csv", header = T, sep = "\t", row.names = 1)
#nt = read.table("overlap_both_tools300719_strandinfo_read_distribution_rpm_percentage.txt.csv", header = F, sep = "\t", row.names = 1)

nt1 = data.frame(nt$isomiR_rpm_embryo, nt$miRNA_rpm_embryo, nt$isomiR_rpm_L1, nt$miRNA_rpm_L1, nt$isomiR_rpm_L2, nt$miRNA_rpm_L2, nt$isomiR_rpm_L3, nt$miRNA_rpm_L3, nt$isomiR_rpm_L4, nt$miRNA_rpm_L4, nt$isomiR_rpm_YA, nt$miRNA_rpm_YA, nt$isomiR_rpm_dauer, nt$miRNA_rpm_dauer)

rownames(nt1) = rownames(nt)

#nt2 = data.frame(nt$Total_read_count_embryo, nt$Total_read_count_L1, nt$Total_read_count_L2, nt$Total_read_count_L3, nt$Total_read_count_L4, nt$Total_read_count_YA, nt$Total_read_count_Daur)
#nt2 = data.frame(nt$Total_reads_embryo_rpm, nt$Total_read_count_L1_rpm, nt$Total_read_count_L2_rpm, nt$Total_read_count_L3_rpm, nt$Total_read_count_L4_rpm, nt$Total_read_count_YA_rpm, nt$Total_read_count_daur_rpm)

#rownames(nt2) = rownames(nt)


nt2 = data.frame(nt$Total_rpm_embryo, nt$Total_rpm_L1, nt$Total_rpm_L2, nt$Total_rpm_L3, nt$Total_rpm_L4, nt$Total_rpm_YA, nt$Total_rpm_dauer)

rownames(nt2) = rownames(nt)


##Gp = c(rep("Embryo",3), rep("L1",2), rep("L2", 2), rep("L3",2), rep("L4", 2), rep("Young_adult",2), rep("Daur",2))

#Group1 = rep(c("Embryo", "L1", "L2", "L3", "L4","Young_adult", "Daur"), 2)
Group1 = c(rep("Embryo",2), rep("L1",2), rep("L2", 2), rep("L3",2), rep("L4", 2), rep("Young_adult",2), rep("Daur",2))

Group2 = rep(c("Embryo", "L1", "L2", "L3", "L4","Young_adult", "Daur"), 1)

##Groupoint = rep(c("isomiR", "miRBase_mature"), 7)


Cond = rep(c("isomiR", "miRNA"), 7)

Cond2 = rep(c("isomiR_reads"), 7)


Lpoint= rep(0,7)


aa = seq(1,nrow(nt),1)

for(i in aa) {
#print(i)

#datap = nt[i,1:ncol(nt)]
#head(datap)

#if(i > aa)
#{
datap = as.numeric(nt1[i,1:length(nt1)])

datap1 = as.numeric(nt2[i,1:length(nt2)])

#datap
print(datap)
#head(datap,2)
dtii=paste("dt",i,sep="_")
dte=paste("dt",i,sep="_")

dtii = data.frame(Group1, Cond, datap)

dte = data.frame(Group2, Lpoint, datap1)

colnames(dtii)=c("Stage","Type","RPM")

colnames(dte)=c("Stage","Type","Reads")

#dt3=print(dt2)
#View(dti)
#head(dt,2)
outfile=paste(rownames(nt1[i,0]), "_rbar.txt", sep="")
outfile1=paste(rownames(nt2[i,0]), "_rline.txt", sep="")
outf1 = paste("new_plots1",outfile, sep="/")
outf2 = paste("new_plots1",outfile1, sep="/")
#print(outfile)
#png(file=outfile,width=300, height=285, units="px", pointsize=12)
#ggplot(dti, aes(fill=Groupoint, y=datap, x=factor(Gp))) + geom_bar(position="fill", stat="identity") + theme_minimal() + geom_text(aes(y = 0, label=Gp), angle = 90, hjust = -.05, face="bold", family="arial", size=4, color="black") + theme(axis.ticks.x=element_blank())  + theme(panel.grid.major.x = element_blank()) + scale_y_continuous(labels = scales::percent) +  theme(legend.text=element_text(size=4,face="bold", family="aerial black")) + guides(fill=FALSE) + ylab("Read distribution (RPM)") + theme(axis.title.y = element_text(size = 6, colour = "black", face="bold")) + theme(axis.text.y = element_text(size = 8, colour = "black", face="bold")) + ggtitle("cel-miR-1-3p") + theme(plot.title = element_text(hjust=0.5, face = "bold")) + theme(axis.text.x=element_blank()) + xlab("")
#dev.off()

write.table(dtii, file=outf1,sep="\t", quote=F, col.names=T, row.names=F)
write.table(dte, file=outf2,sep="\t", quote=F, col.names=T, row.names=F)

#}

}
