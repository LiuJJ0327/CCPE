rm(list = ls())
library(ggplot2)
size = 9
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
  panel.border = element_rect(colour ="black",size=0.5)#,
  #legend.position = 'none'
)

#ten metrics
#mESCs Quartz-Seq data
data<-read.csv("./comparison/1_mesc_Quartz/evaluation_mesc_Quartz_avg.csv",header = T)
colnames(data)<-c('method','metrics','value')
data$metrics<-factor(data$metrics,levels = c("ARI","NMI","RI","Accuracy","Precision","Recall","Fscore"))
data$method<-factor(data$method,levels = c("CCPE","CYCLOPS","cyclone","Cyclum","Seurat","reCAT"))

ggplot(data,aes(metrics,value,fill=method))+
  geom_bar(stat="identity",position="dodge")+
  scale_fill_manual(values=c('#e57266','#61c581','#487CB3','#54BCC2','#FC9303','#cf7cb0'))+mytheme

#E-MTAB-2805 mESCs data
data2<-read.csv("./comparison/2_mesc_288/evaulate_mesc_avg.csv",header = T)
colnames(data2)<-c('method','metrics','value')
data2$metrics<-factor(data2$metrics,levels = c("ARI","NMI","RI","Accuracy","Precision","Recall","Fscore"))
data2$method<-factor(data2$method,levels = c("CCPE","cyclone","Cyclum","Seurat","CYCLOPS","reCAT"))

ggplot(data2,aes(metrics,value,fill=method))+
  geom_bar(stat="identity",position="dodge")+
  scale_fill_manual(values=c('#e57266','#487CB3','#54BCC2','#FC9303','#61c581','#cf7cb0'))+mytheme

