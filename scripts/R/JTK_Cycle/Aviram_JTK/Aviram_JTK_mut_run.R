setwd("/Users/elysialuo/Circadian-Transcriptomics/scripts/R/JTK_Cycle/Aviram_JTK/")
source("../JTK_CYCLE.R")

project <- "Aviram_JTK_RUV_mut_run"

options(stringsAsFactors=FALSE)
annot <- read.delim("Aviram_JTK_RUV_mut_annot.txt")
data <- read.delim("Aviram_JTK_RUV_mut_data.txt")

rownames(data) <- data[,1]
data <- data[,-1]
# 4  4  3  4  4  3  4  4  4  4  4  4
group.sizes <- c(4, 4, 3, 4, 4, 3, 4, 4, 4, 4, 4, 4)
jtkdist(length(group.sizes), group.sizes)  # 12 total time points (0-44), 4 replicates per time point

periods <- 6  # looking for rhythms of 24 hours
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

