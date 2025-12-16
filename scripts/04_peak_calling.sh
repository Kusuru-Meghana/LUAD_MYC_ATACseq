#!/bin/bash
# 04_peak_calling.sh
# Call ATAC-seq peaks using MACS2

# Peak calling for SRR891269
macs2 callpeak \
  -t SRR891269.nochrM.bam \
  -f BAMPE \
  -g hs \
  -n SRR891269_ATAC \
  --outdir peaks \
  --keep-dup all

# Peak calling for SRR891270
macs2 callpeak \
  -t SRR891270.nochrM.bam \
  -f BAMPE \
  -g hs \
  -n SRR891270_ATAC \
  --outdir peaks \
  --keep-dup all
