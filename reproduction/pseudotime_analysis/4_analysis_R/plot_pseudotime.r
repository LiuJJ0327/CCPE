rm(list=ls())
library(ggplot2)
size = 8
mytheme <- theme_bw() + theme(
  axis.text.x = element_text(size = size,color = 'black', angle = 0),
  axis.text.y = element_text(size = size,color = 'black', angle = 0),
  axis.title.x =  element_text(size = size,color = 'black'),
  axis.title.y =  element_text(size = size,color = 'black'),
  title =  element_text(size = size,color = 'black'),
  plot.title = element_text(hjust = 0.5),
  #panel.grid.major = element_line(color = 'black'),
  #panel.grid.minor = element_blank(),
  axis.line = element_line(size=0.5, colour = "black"),
  panel.border = element_rect(colour ="black",size=0.5),
  legend.position = 'none'
)

#mESC_DEG
my_pseudotime<-read.csv("./pseudotime_analysis/3_output/CCPE_pseudotime.csv", header = F)
groundtruth<-read.table("./pseudotime_analysis/1_mesc_Quartz_data/label.txt", header = F)

my_pseudotime[which(groundtruth==1),2]<-'G1'
my_pseudotime[which(groundtruth==2),2]<-'S'
my_pseudotime[which(groundtruth==3),2]<-'G2M'
colnames(my_pseudotime)<-c('pseudo_time','cell_cycle')
my_pseudotime$cell_cycle<-factor(my_pseudotime$cell_cycle,levels=c('G1','S','G2M'))

ggplot(my_pseudotime,aes(cell_cycle,pseudo_time,fill=cell_cycle))+geom_boxplot(outlier.shape = NA)+mytheme
