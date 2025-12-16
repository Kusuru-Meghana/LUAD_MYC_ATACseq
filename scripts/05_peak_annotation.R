# 05_peak_annotation.R
# Annotate ATAC-seq peaks to genes

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(org.Hs.eg.db)

txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene

# Read merged ATAC peaks
peaks <- readPeakFile("results/ATAC_merged_peaks.bed")

# Annotate peaks
peak_anno <- annotatePeak(
  peaks,
  TxDb = txdb,
  tssRegion = c(-3000, 3000),
  annoDb = "org.Hs.eg.db"
)

# Convert to dataframe
anno_df <- as.data.frame(peak_anno)

# Save
write.csv(
  anno_df,
  "data/ATAC_peak_annotations.csv",
  row.names = FALSE
)
