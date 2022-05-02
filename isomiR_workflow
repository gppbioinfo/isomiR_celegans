#!/bin/bash

#######
# Workflow to pre-process small RNA-Seq reads files for isomiRs analysis
#######

# After removing the first part of 3' adapter, we had separated the samples based on their barcode tag by splitting.

# These reads files then provided for second step read filering by removing rest of 3' and 5' adapter

for infastq in $(ls test*.fastq)
do

outfastq=`echo $infastq | sed 's/.fastq//'`

# Removed 3' and 5' adapter
cutadapt -a TGGAATTCTCGGGTGCCAAGG -g 
AATGATACGGCGACCACCGAGATCTACACGTTCAGAGTTCTACAGTCCGA -e 0.1 -j 20 -o $outfastq\.fastq $infastq

# Performed read alignment to genome
subread-align -t 1 -i c_elegan_ref_index -n 35 -m 4 -M 0 -T 20 -I 0 --multiMapping -B 10 -r $outfastq\.fastq -o $outfastq\.subread.M0.bam --sortReadsByCoordinates

# Extracted on 4S?4S CIGAR flag mapped reads
samtools index $outfastq\.subread.M0.bam
samtools view $outfastq\.subread.M0.bam | grep -P "\t4S.*M4S\t" | samtools view - -t chrome.sizes -b -O BAM -o $outfastq\.subread.M0.mapped.bam

# Converting bam into fastq
bamToFastq -i $outfastq\.subread.M0.mapped.bam -fq /dev/stdout | gzip > $outfastq\.mapped.fastq.gz

# Trimming 4 bases from both ends
cutadapt -u 4 -u -4 -o $outfastq\.mapped.fastq.rnd.gz $outfastq\.mapped.fastq.gz --report full -j 12

# Reads filtered in based on their length 
cutadapt -m 17 -M 27 -o $outfastq\.len.mapped.fastq $outfastq\.mapped.fastq.rnd.gz --report full -j 12 -Z

# Collapsed identical reads with counts
fastx_collapser -i $outfastq\.len.mapped.fastq -o $outfastq\.len.mapped.collapsed.fasta

# Prepared input file for isomiR-SEA
fasta_formatter -i $outfastq\.len.mapped.collapsed.fasta -t 0 | sort -u | awk -F"\t" '{if(length($2) < 30) {split($1,a,"_"); gsub(/x/,"",a[3]); print $2"\t"a[3]}}' > $outfastq\.mapped.uniq.txt

# Put everything in the isomiR-SEA script folder (tag_count-all reads file in tab format, mature_22.fa-miRBase mature miRNAs in fasta format)
python2.7 isomiR-SEA_run_script.py 

# We processed the output file from above step "out_result_mature_22_tag_unique.txt" for each samples

perl getisomiR.pl out_result_mature_22_tag_unique.txt > out_result_mature_22_tag_unique.isomiRs.txt







