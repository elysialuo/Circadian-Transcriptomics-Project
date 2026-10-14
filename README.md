# Circadian-Transcriptomics-Project

## Pipeline overview
This pipeline analyses time-course RNA-seq data to simultaneously detect rhythmic and differentially expressed genes, as illustrated in the flowchart below:

![alt text](/results/Figures/Final%20Illustrations/Pipeline%20Flowchart-3.png){width=70%}

## Directory
* Raw and processed data used are stored in /data
* R scripts used for analysing each dataset are stored in /scripts/R, commands to process the FastQ files on the HPC were stored in /script/cluster
* Results and plots are stored in /results

## Sample analysis
A sample analysis script on the Bignon (2023) raw RNAseq data was prepared. To get started with the sample analysis, please see the following scripts:
1. clean up/workflow.md
2. clean up/Sample_new.Rmd or Sample_new.html
All sample files required to run the analysis are in the /clean up folder.


## References

[1]  Wickham H, Averick M, Bryan J, et al. Welcome to the tidyverse. Journal of Open Source Software 2019; 4: 1686.

[2]  Xu S, Hu E, Cai Y, et al. Using clusterProfiler to characterize multiomics data. Nat Protoc 2024; 19: 3292–3320.

[3]  Ewels PA, Peltzer A, Fillinger S, et al. The nf-core framework for community-curated bioinformatics pipelines. Nat Biotechnol 2020; 38: 276–278.

[4]  R Core Team. R: A Language and Environment for Statistical Computing. Vienna, Austria: R Foundation for Statistical Computing, https://www.R-project.org/ (2019).

[5]  Risso D, Ngai J, Speed TP, et al. Normalization of RNA-seq data using factor analysis of control genes or samples. Nat Biotechnol 2014; 32: 896–902.

[6]  Di Tommaso P, Chatzou M, Floden EW, et al. Nextflow enables reproducible computational workflows. Nat Biotechnol 2017; 35: 316–319.

[7]  Bignon Y, Wigger L, Ansermet C, et al. Multiomics reveals multilevel control of renal and systemic metabolism by the renal tubular circadian clock. J Clin Invest; 133. Epub ahead of print 17 April 2023. DOI: 10.1172/JCI167133.

[8]  Singer JM, Hughey JJ. LimoRhyde: A Flexible Approach for Differential Analysis of Rhythmic Transcriptome Data. J Biol Rhythms 2019; 34: 5–18.

[9]  Ritchie ME, Phipson B, Wu D, et al. limma powers differential expression analyses for RNA-sequencing and microarray studies. Nucleic Acids Res 2015; 43: e47.

[10]  Hughes ME, Hogenesch JB, Kornacker K. JTK_CYCLE: an efficient non-parametric algorithm for detecting rhythmic components in genome-scale datasets. J Biol Rhythms 2010; 25: 372–380.

[11]  Wickham H. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, https://ggplot2.tidyverse.org (2016).

[12]  Chen S. fastp 1.0: An ultra-fast all-round tool for FASTQ data quality control and preprocessing. Imeta 2025; 4: e70078.

[13]  Chen Y, Chen L, Lun ATL, et al. edgeR v4: powerful differential analysis of sequencing data with expanded functionality and improved support for small counts and larger datasets. Nucleic Acids Res 2025; 53: gkaf018.

[14]  Inc PT. Collaborative data science, https://plot.ly (2015).

[15]  Yu G, Wang L-G, Han Y, et al. clusterProfiler: an R package for comparing biological themes among gene clusters. OMICS 2012; 16: 284–287.

[16]  Miyazaki M, Schroder E, Edelmann SE, et al. Age-associated disruption of molecular clock expression in skeletal muscle of the spontaneously hypertensive rat. PLoS One 2011; 6: e27168.
