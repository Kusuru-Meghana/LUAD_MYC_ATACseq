#!/bin/bash
# 01_qc.sh
# Quality control for ATAC-seq FASTQ files

# Tools used:
# - FastQC
# - MultiQC

# Run FastQC on paired-end ATAC-seq reads
fastqc SRR891269_1.fastq.gz SRR891269_2.fastq.gz
fastqc SRR891270_1.fastq.gz SRR891270_2.fastq.gz

# Aggregate QC reports
multiqc .
