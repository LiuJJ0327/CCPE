rm(list = ls())
library(mclust)
CCPE_pseudotime<-read.csv("./Figure2/3_output/CCPE_pseudotime.csv", header = F)
groundtruth<-read.table("./Figure2/1_mesc_Quartz_data/label.txt", header = F)
CCPE_mclust_result <- MclustDA(CCPE_pseudotime$V1, groundtruth$V1)
CCPE_pred <- predict(CCPE_mclust_result, newdata = CCPE_mclust_result$data)
CCPE_predict_label<-CCPE_pred$classification
CCPE_predict_label<-as.data.frame(CCPE_predict_label)
write.table(CCPE_predict_label,file="./Figure3/1_mesc_Quartz/output/predlabel/CCPE_predlabel.txt",row.names = F,col.names = F,quote = F)
