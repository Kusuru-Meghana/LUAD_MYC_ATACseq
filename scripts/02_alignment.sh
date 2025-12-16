#!/bin/bash
# 02_alignment.sh
# Align ATAC-seq reads to the hg38 genome using HISAT2

# Genome index (hg38)
GENOME_INDEX=hg38

# Align paired-end reads
hisat2 -x $GENOME_INDEX \
  -1 SRR891269_1.fastq.gz \
  -2 SRR891269_2.fastq.gz \
  -S SRR891269.hisat2.sam

hisat2 -x $GENOME_INDEX \
  -1 SRR891270_1.fastq.gz \
  -2 SRR891270_2.fastq.gz \
  -S SRR891270.hisat2.sam
