# Transcriptome_Analysis_LPS_Treatment

This project analyzes transcriptome data to identify differentially expressed genes in samples treated with Lipopolysaccharide (LPS) compared to control samples. The analysis pipeline includes quality control, transcript quantification, and differential expression analysis.

## Project Overview

The goal of this project is to understand the transcriptional changes induced by LPS treatment. [cite_start]The analysis was performed on two control samples (309 and 310) and two LPS-treated test samples (313 and 314)[cite: 30, 31, 128, 129, 130].

The workflow consists of the following steps:
1.  [cite_start]**Quality Control**: Raw sequencing reads were processed using **Trimmomatic** to remove the first 10 base pairs[cite: 15, 30].
2.  [cite_start]**Transcript Quantification**: The processed reads were quantified against a reference transcriptome using **Salmon**[cite: 19, 36].
3.  [cite_start]**Differential Expression Analysis**: The transcript counts were analyzed using the **DESeq2** package in R to identify differentially expressed genes[cite: 102].

## Results

### MA Plot

The MA plot shows the log2 fold change in gene expression between the LPS-treated and control groups versus the mean of normalized counts. [cite_start]Genes with statistically significant differential expression are highlighted in blue[cite: 132, 127].

![MA Plot](results/MA_plot.png)

### PCA Plot

The Principal Component Analysis (PCA) plot visualizes the overall variance in gene expression between the samples. [cite_start]The plot shows a clear separation between the control and treatment groups, indicating that the LPS treatment is the primary source of variation in the data[cite: 166, 150].

![PCA Plot](results/PCA_plot.png)

## How to Run the Analysis

### Prerequisites
* [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
* [Salmon](https://combine-lab.github.io/salmon/)
* [R](https://www.r-project.org/) and the following packages:
    * `DESeq2`
    * `tximport`
    * `readr`
    * `ggplot2`

### Steps

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/Transcriptome_Analysis_LPS_Treatment.git](https://github.com/your-username/Transcriptome_Analysis_LPS_Treatment.git)
    cd Transcriptome_Analysis_LPS_Treatment
    ```

2.  **Add raw data:**
    Place your raw `.fastq` files and the reference transcriptome `rna.fna` into the `data/` directory.

3.  **Run the quality control script:**
    ```bash
    bash scripts/01_quality_control.sh
    ```

4.  **Run the quantification script:**
    ```bash
    bash scripts/02_quantification.sh
    ```

5.  **Run the differential expression analysis script:**
    ```Rscript
    Rscript scripts/03_deseq2_analysis.R
    ```
The output plots will be saved in the `results/` directory.
