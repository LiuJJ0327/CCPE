rm(list=ls())
library(ggpubr)
library(ggplot2)
library(Seurat)
size = 8
mytheme <- theme_bw() + theme(
  axis.text.x = element_text(size = size,color = 'black', angle = 0),
  axis.text.y = element_text(size = size,color = 'black', angle = 0),
  #axis.title.x =  element_text(size = size,color = 'black'),
  #axis.title.y =  element_text(size = size,color = 'black'),
  axis.title = element_blank(),
  title =  element_text(size = size,color = 'black'),
  plot.title = element_text(hjust = 0.5),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  axis.line = element_line(size=0.5, colour = "black"),
  panel.border = element_rect(colour ="black",size=0.5),
  legend.position = 'none'
)
##input: cell X gene
mesc_DEG<-read.table("./pseudotime_analysis/1_mesc_Quartz_data/mESC_Quartz_preprocessed.txt",header=T,row.names = 1)
mesc_DEG<-t(mesc_DEG)
mesc_DEG<-as.data.frame(mesc_DEG)
my_pseudotime<-read.csv("./pseudotime_analysis/3_output/CCPE_pseudotime.csv", header = F)
label<-read.table("./pseudotime_analysis/1_mesc_Quartz_data/label.txt", header = F)


correlation<-matrix(0,ncol(mesc_DEG),1)
rownames(correlation)<-colnames(mesc_DEG)


for (i in 1:ncol(mesc_DEG)){
  correlation[i,1]=cor(mesc_DEG[,i],my_pseudotime$V1)
}
write.table(correlation,"C:/Users/jliu25/Desktop/correlation_mesc_Quartz.txt",row.names = T)

#show genes with high correlations
c<-correlation[,1]
c<-sort(c,decreasing = T)


#plot correlation of gene Aurka
plotdata<-matrix(0,nrow(mesc_DEG),3)
plotdata[,1]<-my_pseudotime$V1
plotdata[,2]<-mesc_DEG$Aurka
plotdata[,3]<-label$V1
plotdata<-as.data.frame(plotdata)
colnames(plotdata)<-c("x","y","colors")
ggplot(plotdata, aes(x=x, y=y))+geom_point(aes(color = factor(colors)))+stat_smooth(method="lm",se=FALSE)+stat_cor(data=plotdata, method = "pearson")+mytheme


