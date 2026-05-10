# Circadian-Transcriptomics-Project

## Pipeline overview
This pipeline analyses time-course RNA-seq data to simultaneously detect rhythmic and differentially expressed genes, as illustrated in the flowchart below:

![alt text](/results/Figures/Final%20Illustrations/Pipeline%20Flowchart-3.png)

## Directory
* Raw and processed data used are stored in /data
* R scripts used for analysing each dataset are stored in /scripts/R, commands to process the FastQ files on the HPC were stored in /scirpt/cluster
* Results and plots are stored in /results

## Setup
Run the following before using the pipeline to set up the environment required:

```r
    source("setup.R")


