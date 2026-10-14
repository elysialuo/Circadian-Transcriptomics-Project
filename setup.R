# setup.R

# Set CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Get list of currently installed packages
installed_pkgs <- rownames(installed.packages())

# 1. Install BiocManager if missing
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# 2. CRAN packages
cran_packages <- c(
  "tidyverse",
  "stringr",
  "ggplot2",
  "ggpubr",
  "MASS",
  "janitor",
  "naniar",
  "patchwork",
  "scales",
  "cluster",
  "data.table",
  "VennDiagram",
  "plotly",
  "RColorBrewer",
  "ggrepel",
  "foreach",
  "ggExtra",
  "devtools"
)

missing_cran <- setdiff(cran_packages, installed_pkgs)
if (length(missing_cran) > 0) {
  install.packages(missing_cran)
}

# 3. Bioconductor packages
bioc_packages <- c(
  "limma",
  "edgeR",
  "RUVSeq",
  "limorhyde",
  "GEOquery",
  "AnnotationHub",
  "AnnotationDbi",
  "ensembldb",
  "org.Mm.eg.db",
  "annotate",
  "clusterProfiler"
)

missing_bioc <- setdiff(bioc_packages, installed_pkgs)
if (length(missing_bioc) > 0) {
  BiocManager::install(missing_bioc, update = FALSE)
}

# 4. GitHub packages
if (!requireNamespace("dryR", quietly = TRUE)) {
  devtools::install_github("naef-lab/dryR")
}