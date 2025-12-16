# LUAD_MYC_ATACseq

## Overview

This repository contains the ATAC-seq processing pipeline used to identify open chromatin regions in lung adenocarcinoma (LUAD) cells. The goal of this analysis was to define genome-wide chromatin accessibility that could later be integrated with MYC ChIP-seq and RNA-seq data as part of a multi-layer regulatory analysis.

Rather than interpreting ATAC-seq in isolation, this layer serves as the chromatin accessibility component of a three-layer integration framework to identify functional MYC-regulated genes.

## Data Description

ATAC-seq was performed on LUAD samples (SRR891269 and SRR891270). Raw sequencing data were processed locally/HPC and are not included in this repository due to size constraints.

This repository contains:

- Fully reproducible processing scripts

- Final peak calls and annotated results used for downstream integration

## Pipeline Summary

The ATAC-seq workflow follows standard best practices:

- Quality Control

Raw FASTQ files were assessed using FastQC and summarized with MultiQC.

- Alignment

Reads were aligned to the human reference genome (hg38) using HISAT2.

- BAM Processing

SAM-to-BAM conversion

- Sorting and indexing

Removal of mitochondrial reads and low-quality alignments

- Peak Calling

Open chromatin regions were identified using MACS2.

- Peak Annotation

Peaks were annotated to nearby genes and genomic features using R.


## Repository Structure
```
LUAD_MYC_ATACseq/
├── scripts/
│   ├── 01_qc.sh
│   ├── 02_alignment.sh
│   ├── 03_bam_processing.sh
│   ├── 04_peak_calling.sh
│   └── 05_peak_annotation.R
│
├── results/
│   ├── SRR891269_ATAC_peaks.xls
│   ├── SRR891270_ATAC_peaks.xls
│   └── ATAC_peak_annotations.csv
│
└── README.md
```

## Results

The final output of this analysis includes:

- High-confidence ATAC-seq peak calls for each sample

- Annotated peak-to-gene associations identifying accessible regulatory regions

These results were not interpreted independently, but were used as input for downstream integration with:

- MYC ChIP-seq (binding evidence)

- RNA-seq (transcriptional response)
  

## Role in Multi-Omics Integration

ATAC-seq provides the chromatin accessibility context necessary to distinguish functional MYC binding events from non-functional binding.

In the full three-layer analysis:

- ChIP-seq identifies MYC binding sites

- ATAC-seq confirms chromatin accessibility
- RNA-seq measures transcriptional consequences

Only genes supported by all three layers were considered high-confidence MYC targets.

The integrated analysis is maintained in a separate repository to keep each layer modular, interpretable, and reproducible.

## Reproducibility

All processing steps are fully documented through version-controlled scripts.
Paths and resource usage may need adjustment depending on the computational environment.

## License

This project is released under the MIT License.
