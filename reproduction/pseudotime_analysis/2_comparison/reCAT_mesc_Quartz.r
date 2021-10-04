#data: cell X gene
rm(list = ls())
library(ggplot2)
library(doParallel)
library(mclust)
library(cluster)
library(TSP)
setwd("C:/Users/jliu25/Desktop/Codes/reCAT-master/R")

mesc_DEG<-read.table("C:/Users/jliu25/Desktop/My_project/1_cellcycle_data/1_mESC_QuartzSeq/2_mesc_Quartz.txt",header=T,row.names = 1)
mesc_DEG<-t(mesc_DEG)
mesc_DEG<-log2(mesc_DEG+1)
mesc_DEG<-as.matrix(mesc_DEG)

source("get_test_exp.R")
test_exp <- get_test_exp(t(mesc_DEG))

source("get_ordIndex.R")
ordIndex <- get_ordIndex(test_exp, 5)
write.table(ordIndex,"C:/Users/jliu25/Desktop/My_project/4_output/output_pseudotime/1_mESC_Quartz/reCAT_pseudotime.txt",row.names = F,col.names = F,quote = F)


source("get_score.R")
score_result <- get_score(t(test_exp))

source("plot.R")
plot_bayes(score_result$bayes_score, ordIndex)
plot_mean(score_result$mean_score, ordIndex)


source("get_hmm.R")
load("../data/ola_mES_2i_region.RData")
rdata[1,1]<-7
rdata[1,2]<-12
rdata[2,1]<-15
rdata[2,2]<-20
rdata[3,1]<-27
rdata[3,2]<-32
myord = c(4:1, 35:5)  #change number
hmm_result <- get_hmm_order(bayes_score = score_result$bayes_score, 
                            mean_score = score_result$mean_score, 
                            ordIndex = ordIndex, cls_num = 3, myord = myord, rdata = rdata)
write.table(hmm_result,"C:/Users/jliu25/Desktop/My_project/4_output/output_label/mESC_Quartz/reCAT_predlabel.txt",row.names = F,col.names = F,quote = F)

