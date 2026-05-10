# setup.R

# Set CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Install BiocManager if missing
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# CRAN packages
cran_packages <- c(
  "tidyverse",
  "dryR",
  "ggpubr",
  "MASS",
  "janitor",
  "naniar",
  "patchwork",
  "scales",
  "cluster",
  "RColorBrewer",
  "ggrepel",
  "data.table",
  "foreach",
  "VennDiagram",
  "plotly",
  "ggExtra"
)

# Bioconductor packages
bioc_packages <- c(
  "GEOquery",
  "AnnotationHub",
  "AnnotationDbi",
  "ensembldb",
  "limma",
  "edgeR",
  "RUVSeq",
  "limorhyde",
  "annotate",
  "org.Mm.eg.db",
  "clusterProfiler"
)

# Install missing CRAN packages
installed_packages <- rownames(installed.packages())

missing_cran <- setdiff(cran_packages, installed_packages)

if (length(missing_cran) > 0) {
  install.packages(missing_cran)
}

# Install missing Bioconductor packages
missing_bioc <- setdiff(bioc_packages, installed_packages)

if (length(missing_bioc) > 0) {
  BiocManager::install(missing_bioc)
}