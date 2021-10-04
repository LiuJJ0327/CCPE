rm(list=ls())
library(umap)
library(ggplot2)
size = 9
mytheme <- theme_bw() + theme(
  axis.text.x = element_text(size = size,color = 'black', angle = 0),
  axis.text.y = element_text(size = size,color = 'black', angle = 0),
  axis.title = element_blank(),
  title =  element_text(size = size,color = 'black'),
  plot.title = element_text(hjust = 0.5),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  axis.line = element_line(size=0.5, colour = "black"),
  panel.border = element_rect(colour ="black",size=0.5)#,
)

#DMSO_24h
cellcycle_DMSO<-read.table("./Cancer_cellline/data/DMSO_24hr_expt1/DMSO_predlabel.txt", header = F)
cellcycle_DMSO<-cellcycle_DMSO$V1
cellcycle_DMSO<-factor(cellcycle_DMSO,levels=c('G1','S','G2M'))

d_DMSO<- read.table("./Cancer_cellline/data/DMSO_24hr_expt1/rawdata.txt", header = T,row.names = 1, sep = "\t")
d_DMSO<-log2(d_DMSO+1)
set.seed(20)
d.umap_DMSO<- umap(t(d_DMSO))

plot_DMSO<-d.umap_DMSO$layout
plot_DMSO<-as.data.frame(plot_DMSO)
colnames(plot_DMSO)<-c('umap1','umap2')

ggplot(plot_DMSO,aes(x=umap1,y=umap2))+
  geom_point(aes(colour=cellcycle_DMSO))+
  scale_color_manual(values=c('#D2352B','#67AC57','#487DB3'))+mytheme


#Nutlin_24h
cellcycle_Nutlin<-read.table("./Cancer_cellline/data/Nutlin_24hr_expt1/Nutlin_predlabel.txt", header = F)
cellcycle_Nutlin<-cellcycle_Nutlin$V1
cellcycle_Nutlin<-factor(cellcycle_Nutlin,levels=c('G1','S','G2M'))

d_Nutlin<- read.table("./Cancer_cellline/data/Nutlin_24hr_expt1/rawdata.txt", header = T,row.names = 1, sep = "\t")
d_Nutlin<-log2(d_Nutlin+1)
set.seed(30)
d.umap_Nutlin <- umap(t(d_Nutlin))

plot_Nutlin<-d.umap_Nutlin$layout
plot_Nutlin<-as.data.frame(plot_Nutlin)
colnames(plot_Nutlin)<-c('umap1','umap2')

ggplot(plot_Nutlin,aes(x=umap1,y=umap2))+
  geom_point(aes(colour=cellcycle_Nutlin))+
  scale_color_manual(values=c('#D2352B','#67AC57','#487DB3'))+mytheme
