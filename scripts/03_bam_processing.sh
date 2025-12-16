#!/bin/bash
# 03_bam_processing.sh
# Convert SAM to BAM, sort, remove chrM, and index ATAC-seq alignments

# Convert SAM to BAM
samtools view -bS SRR891269.hisat2.sam > SRR891269.bam
samtools view -bS SRR891270.hisat2.sam > SRR891270.bam

# Sort BAM files
samtools sort SRR891269.bam -o SRR891269.sorted.bam
samtools sort SRR891270.bam -o SRR891270.sorted.bam

# Remove mitochondrial reads (chrM)
samtools view -h SRR891269.sorted.bam | grep -v chrM | samtools view -b > SRR891269.nochrM.bam
samtools view -h SRR891270.sorted.bam | grep -v chrM | samtools view -b > SRR891270.nochrM.bam

# Index final BAM files
samtools index SRR891269.nochrM.bam
samtools index SRR891270.nochrM.bam
