setwd("/Users/elysialuo/Circadian-Transcriptomics/scripts/R/JTK_Cycle/Yang_JTK/")
# setwd("/Users/elou/Desktop/Circadian-Transcriptomics/scripts/R/JTK_Cycle/")
source("../JTK_CYCLE.R")

project <- "Yang_JTK_RUV_mut_run"

options(stringsAsFactors=FALSE)
annot <- read.delim("Yang_JTK_RUV_mut_annot.txt")
data <- read.delim("Yang_JTK_RUV_mut_data.txt")

rownames(data) <- data[,1]
data <- data[,-1]
jtkdist(6, 4)  # 6 total time points, 4 replicates per time point

periods <- 6  # looking for rhythms of 24 hours
jtk.init(periods,4)  # 4 is the number of hours between time points

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

