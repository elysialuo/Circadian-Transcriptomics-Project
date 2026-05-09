mkdir -p $HOME/nf_containers
export NXF_SINGULARITY_CACHEDIR="$HOME/nf_containers"  //need to run this line in every new terminal


# Bignon
1. accessions file
    /lmb/home/eluo/Bignon/accessions.csv
    
2. fetchngs *sratools*
    nextflow run nf-core/fetchngs -r 1.12.0 --input /lmb/home/eluo/Bignon/accessions.csv --download_method sratools -config /public/singularity/containers/nextflow/lmb-nextflow/lmb.config -queue-size 4 --outdir results -bg 

3. rnaseq
    *HiSeq - no need poly-G trimming*
    nextflow run nf-core/rnaseq -r 3.12.0 --input samplesheet_new.csv --genome mus_musculus.GRCm39.release_108 -config /public/singularity/containers/nextflow/lmb-nextflow/lmb.config --outdir nextflow_results_2 --deseq2_vst --trimmer fastp --extra_fastp_args '--low_complexity_filter --complexity_threshold 30' -bg
    *bruh i didn't do ribo-remove before...*

    Modified version (to run later):
    *forced polyG trimmer*
    *remve rRNA*
    *low complexity filter*
    nextflow run nf-core/rnaseq -r 3.12.0 --input samplesheet_new.csv --genome mus_musculus.GRCm39.release_108 -config /public/singularity/containers/nextflow/lmb-nextflow/lmb.config --outdir nextflow_results_3 --deseq2_vst --trimmer fastp --extra_fastp_args '--trim_poly_g --low_complexity_filter --complexity_threshold 30' --remove_ribo_rna -bg
    **but SORTMERNA doesn't work, need to ask steve**
    **current version: no remove_ribo_rna**



# Aviram
1. accessions file
    /cephfs2/ngs/eluo/aviram.accession.csv

2. fetchngs command *sratools*
    nextflow run nf-core/fetchngs -r 1.12.0 --input /cephfs2/ngs/eluo/Aviram_QC/aviram.accession.csv --download_method sratools -config /public/singularity/containers/nextflow/lmb-nextflow/lmb.config -queue-size 4 --outdir results -bg

3. rnaseq command
    *forced polyG trimmer*
    *remve rRNA*
    *low complexity filter*
    nextflow run nf-core/rnaseq -r 3.12.0 --input samplesheet_filtered.csv --genome mus_musculus.GRCm39.release_108 -config /public/singularity/containers/nextflow/lmb-nextflow/lmb.config --outdir nextflow_results --deseq2_vst --trimmer fastp --extra_fastp_args '--trim_poly_g --low_complexity_filter --complexity_threshold 30' --remove_ribo_rna -bg
    **but SORTMERNA doesn't work, need to ask steve**
    **current version: no remove_ribo_rna**