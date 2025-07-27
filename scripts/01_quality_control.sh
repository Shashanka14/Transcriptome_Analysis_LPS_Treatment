#!/bin/bash

# This script performs quality control on the raw sequencing reads using Trimmomatic.
# It removes the first 10 bases from each read for both control and test samples.

# Create directories for trimmed output
mkdir -p ../trimmed_data

# Process control sample 309
java -jar trimmomatic-0.39.jar PE -phred33 \
    ../data/MT_2025_00309_524_R1_001.fastq ../data/MT_2025_00309_524_R2_001.fastq \
    ../trimmed_data/trimmed_1_309.fastq ../trimmed_data/unpaired_1_309.fastq \
    ../trimmed_data/trimmed_2_309.fastq ../trimmed_data/unpaired_2_309.fastq \
    HEADCROP:10

# Process control sample 310 (assuming similar naming)
# java -jar trimmomatic-0.39.jar PE -phred33 \
#     ../data/MT_2025_00310_XXX_R1_001.fastq ../data/MT_2025_00310_XXX_R2_001.fastq \
#     ../trimmed_data/trimmed_1_310.fastq ../trimmed_data/unpaired_1_310.fastq \
#     ../trimmed_data/trimmed_2_310.fastq ../trimmed_data/unpaired_2_310.fastq \
#     HEADCROP:10

# Process test sample 313
java -jar trimmomatic-0.39.jar PE -phred33 \
    ../data/MT_2025_00313_528_R1_001.fastq ../data/MT_2025_00313_528_R2_001.fastq \
    ../trimmed_data/trimmed_1_313.fastq ../trimmed_data/unpaired_1_313.fastq \
    ../trimmed_data/trimmed_2_313.fastq ../trimmed_data/unpaired_2_313.fastq \
    HEADCROP:10

# Process test sample 314
java -jar trimmomatic-0.39.jar PE -phred33 \
    ../data/MT_2025_00314_529_R1_001.fastq ../data/MT_2025_00314_529_R2_001.fastq \
    ../trimmed_data/trimmed_1_314.fastq ../trimmed_data/unpaired_1_314.fastq \
    ../trimmed_data/trimmed_2_314.fastq ../trimmed_data/unpaired_2_314.fastq \
    HEADCROP:10
