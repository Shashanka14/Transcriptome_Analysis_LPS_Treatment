# This script performs differential gene expression analysis using DESeq2.
# It takes the Salmon quantification files as input and generates an MA plot and a PCA plot.

# Install necessary packages if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("DESeq2", "tximport", "readr", "ggplot2"))

# Load libraries
library(DESeq2)
library(tximport)
library(readr)
library(ggplot2)

# Create a sample metadata table
sample_files <- c(
  "../salmon_quant/salmon_quant_309/quant.sf",
  "../salmon_quant/salmon_quant_310/quant.sf", # Assuming sample 310 exists
  "../salmon_quant/salmon_quant_313/quant.sf",
  "../salmon_quant/salmon_quant_314/quant.sf"
)
sample_names <- c("control_309", "control_310", "treatment_313", "treatment_314")
sample_conditions <- c("control", "control", "treatment", "treatment")

sample_table <- data.frame(
  sample = sample_names,
  filename = sample_files,
  condition = sample_conditions
)

# Import transcript quantification data
txi <- tximport(sample_files, type = "salmon", txOut = TRUE)

# Create a DESeqDataSet
dds <- DESeqDataSetFromTximport(txi, colData = sample_table, design = ~ condition)

# Run the DESeq2 analysis
dds <- DESeq(dds)
res <- results(dds)

# Generate and save the MA plot
png("../results/MA_plot.png", width = 800, height = 600)
plotMA(res, main = "MA Plot")
dev.off()

# Generate and save the PCA plot
vsd <- vst(dds, blind = FALSE)
png("../results/PCA_plot.png", width = 800, height = 600)
plotPCA(vsd, intgroup = "condition")
dev.off()
