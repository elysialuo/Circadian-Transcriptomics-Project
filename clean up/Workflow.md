1. Download RNA-seq data

    a. accessions file (downloaded online)
        
        e.g. /lmb/home/eluo/Bignon/accessions.csv

    b. fetchngs (on HPC, command generated with LMB's online tool)
    
        nextflow run nf-core/fetchngs -r 1.12.0 --input /lmb/home/eluo/Bignon/accessions.csv --download_method sratools -config /public/singularity/containers/nextflow/lmb-nextflow/lmb.config -queue-size 4 --outdir results -bg
        (sratools used for Bignon's data as the regular option is not working)

2. QC on downloaded RNA-seq files

    Command ran for Bignon:

        nextflow run nf-core/rnaseq -r 3.12.0 --input samplesheet_new.csv --genome mus_musculus.GRCm39.release_108 -config /public/singularity/containers/nextflow/lmb-nextflow/lmb.config --outdir nextflow_results_2 --deseq2_vst --trimmer fastp --extra_fastp_args '--low_complexity_filter --complexity_threshold 30' -bg

    '--remove_ribo_rna' was also used in Bignon's analysis but it was not included for my analysis as relevant setting could only be done by admin (e.g. Steven), but the results obtianed after gene annotation was mostly similar to that done with the filter.


(Sorry, I don't exactly remember in which folder I ran these commands...)


3. Inspect the multiqc file to check the quality of the RNA-seq and processing, proceed if all good

4. Download **'salmon.merged.gene_counts.rds'** from the results folder for analysis in RStudio, prepare a metadata matrix csv file (or download later with getGEO if data is obtained online)

5. Download the **series matrix** from the 

5. Data analysis on RStudio (see rmarkdown script)

