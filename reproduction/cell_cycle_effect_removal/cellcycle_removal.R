rm(list = ls())
library(ggplot2)
size = 9
mytheme <- theme_bw() + theme(
  axis.text.x = element_text(size = size,color = 'black', angle = 0),
  axis.text.y = element_text(size = size,color = 'black', angle = 0),
  title =  element_text(size = size,color = 'black'),
  plot.title = element_text(hjust = 0.5),
  legend.position = 'none'
)

load("./cell_cycle_effect_removal/416b.Rdata")

celltype<-read.table("./cell_cycle_effect_removal/celltype_label.txt",header = F)
predlabel<-read.table("./cell_cycle_effect_removal/CCPE_predlabel.txt",header = F)
#data pre-processing
sce.416b$block <- factor(sce.416b$block)
sce.416b <- computeSumFactors(sce.416b)
sce.416b <- logNormCounts(sce.416b)
dec.416b <- modelGeneVarWithSpikes(sce.416b, "ERCC", block=sce.416b$block)
chosen.hvgs <- getTopHVGs(dec.416b, prop=0.1)
assay(sce.416b, "corrected") <- removeBatchEffect(logcounts(sce.416b), 
                                                  design=model.matrix(~sce.416b$phenotype), batch=sce.416b$block)
sce.416b <- runPCA(sce.416b, ncomponents=10, subset_row=chosen.hvgs,
                   exprs_values="corrected", BSPARAM=BiocSingular::ExactParam())

#remove cell cycle genes
diff <- getVarianceExplained(sce.416b, predlabel)
discard <- diff > 5
summary(discard)
set.seed(100011)
top.discard <- getTopHVGs(dec.416b[which(!discard),], n=1000)
sce.416b.discard <- runPCA(sce.416b, subset_row=top.discard)

#PCA plot
data_CCPE<-sce.416b.discard@int_colData@listData$reducedDims@listData$PCA[,1:2]
data_CCPE<-as.data.frame(data_CCPE)
data_CCPE$celltype<-celltype$V1
ggplot(data_CCPE, aes(x=PC1, y=PC2, color=celltype))+geom_point(size = 1)+
  scale_color_manual(values=c("#4a79c9","#f77379"))+labs(x="PC1",y="PC2",title = "CCPE")+mytheme

