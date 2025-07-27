#!/bin/bash

# This script performs transcript quantification using Salmon.
# It first indexes the reference transcriptome and then quantifies the abundance of transcripts for each sample.

# Create directories for salmon output
mkdir -p ../salmon_quant

# Index the reference transcriptome
salmon index -t rna.fna -i salmon_transcript_index

# Quantify transcripts for control sample 309
salmon quant -i salmon_transcript_index -l A \
    -1 ../trimmed_data/trimmed_1_309.fastq -2 ../trimmed_data/trimmed_2_309.fastq \
    -p 8 -o ../salmon_quant/salmon_quant_309 --validateMappings

# Quantify transcripts for control sample 310
# salmon quant -i salmon_transcript_index -l A \
#     -1 ../trimmed_data/trimmed_1_310.fastq -2 ../trimmed_data/trimmed_2_310.fastq \
#     -p 8 -o ../salmon_quant/salmon_quant_310 --validateMappings

# Quantify transcripts for test sample 313
salmon quant -i salmon_transcript_index -l A \
    -1 ../trimmed_data/trimmed_1_313.fastq -2 ../trimmed_data/trimmed_2_313.fastq \
    -p 8 -o ../salmon_quant/salmon_quant_313 --validateMappings

# Quantify transcripts for test sample 314
salmon quant -i salmon_transcript_index -l A \
    -1 ../trimmed_data/trimmed_1_314.fastq -2 ../trimmed_data/trimmed_2_314.fastq \
    -p 8 -o ../salmon_quant/salmon_quant_314 --validateMappings
