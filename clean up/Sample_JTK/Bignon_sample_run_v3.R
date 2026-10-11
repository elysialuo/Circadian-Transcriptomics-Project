setwd("/Users/elysialuo/Circadian-Transcriptomics/clean up/Sample_JTK/")  # change into appropriate working directory
source("JTK_CYCLE_v3_sample.R")

project <- "Bignon_JTK_run_v3"

options(stringsAsFactors=FALSE)
annot <- read.delim("Bignon_sample_annot.txt")  # change into corresponding names of the .txt files saved
data <- read.delim("Bignon_sample_data.txt")  # ..

rownames(data) <- data[,1]
data <- data[,-1]
jtkdist(6, 5)  # (x,y): x time points in total, y replicates per time point

periods <- 6  # looking for hyrhms of 24 hours (i.e. 6 time points of 4 hours per cycle). (Notes: this can be a range)
jtk.init(periods, 4)  # 4 is the number of hours between time points

cat("JTK analysis started on",date(),"\n")
flush.console()

st <- system.time({
  res <- apply(data,1,function(z) {
    jtkx(z)
    c(JTK.ADJP,JTK.PERIOD,JTK.LAG,JTK.AMP)
  })
  res <- as.data.frame(t(res))
  bhq <- p.adjust(unlist(res[,1]),"BH")
  res <- cbind(bhq,res)
  colnames(res) <- c("BH.Q","ADJ.P","PER","LAG","AMP")
  results <- cbind(annot,res,data)
  results <- results[order(res$ADJ.P,-res$AMP),]
})
print(st)

save(results,file=paste("JTK",project,"rda",sep="."))
write.table(results,file=paste("JTK",project,"txt",sep="."),row.names=F,col.names=T,quote=F,sep="\t")

