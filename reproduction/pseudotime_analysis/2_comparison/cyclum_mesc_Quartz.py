import os,sys,inspect
import pandas as pd
from sklearn import preprocessing
import matplotlib.pyplot as plt
import numpy as np
import cyclum.tuning
cell_line = "mESC"

#for DEG data,read .txt
#input is cell x genes.
#raw_Y=pd.read_table('/data5/jliu25/cellcycle_scripts/mESC_Quartz/mESC_Quartz_DEG_log.txt',sep='\t')
#raw_Y=raw_Y.T

#############################
raw_Y=pd.read_table('/data5/jliu25/cellcycle_scripts/mESC_Quartz/mesc_QuartzSEQ_raw.txt',sep='\t')
raw_Y=raw_Y.T
raw_Y=raw_Y.drop(labels='id',axis=0)   ###delete the first row
raw_Y=raw_Y.drop(labels='gene.symbol',axis=0)
print("Original dimesion %d cells x %d genes." % raw_Y.shape)
#Original dimesion 361 cells x 253 genes.
cpt = np.loadtxt('/data5/jliu25/cellcycle_scripts/mESC_Quartz/label.txt')
print(f"G0/G1 {sum(cpt == 1.0)}, S {sum(cpt == 2.0)}, G2/M {sum(cpt == 3.0)}")
#G0/G1 [85], S [141], G2/M [135]
Y = preprocessing.scale(raw_Y)
N, D = Y.shape
print('After filtering %d Cells (instances) x %d Genes (features)'%(N, D))

model = cyclum.tuning.CyclumAutoTune(Y, max_linear_dims=3, 
                                     epochs=2000, rate=5e-4, verbose=100,
                                     encoder_width=[30, 20])

#Training
import cyclum.models
model = cyclum.models.AutoEncoder(input_width=Y.shape[1],
                                  encoder_width=[30, 20], 
                                  encoder_depth=2,
                                 n_circular_unit=2,
                                 n_logistic_unit=0,
                                 n_linear_unit=0,
                                 n_linear_bypass=3,
                                 dropout_rate=0.1)
model.train(Y, epochs=1000, verbose=100, rate=2e-4)

pseudotime = model.predict_pseudotime(Y)

#save pseudotime to txt
np.savetxt("/data5/jliu25/cellcycle_scripts/output_pseudotime_rawdata/cyclum/cyclum_mESC_Quartz.txt", pseudotime,fmt='%f',delimiter='\t')

#save scale_data to txt
#np.savetxt("/data5/jliu25/Cyclum/data_txt/mb_data_scale.txt", Y,fmt='%f',delimiter='\t')
