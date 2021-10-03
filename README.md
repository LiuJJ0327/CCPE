# CCPE

## Introduction
CCPE is a cell cycle pseudotime estimation method characterizing cell cycle timing from single-cell RNA-seq data. CCPE maps high-dimensional scRNA-seq data onto a helix in three-dimensional space, where 2D space is used to capture the cycle information in scRNA-seq data, and one dimension to predict the chronological orders of cells along the cycle, which we called cell cycle pseudotime. ScRNA-seq data is repeatedly transformed from high dimensional to low dimensional and then mapped back to high dimensional. At the same time, CCPE iteratively optimizes the discriminative dimensionality reduction via learning a helix until convergence (Figure 1). CCPE is applied to several downstream analyses and applications to demonstrate its ability to accurately estimate the cell cycle pseudotime and stages.<br/>
![image](https://github.com/LiuJJ0327/CCPE/blob/main/images/figure1.PNG)<br/>
The preprint version of our paper is available at [Jiajia Liu, Mengyuan Yang, Weiling Zhao, Xiaobo Zhou
bioRxiv 2021.06.13.448263; doi: https://doi.org/10.1101/2021.06.13.448263](https://www.biorxiv.org/content/10.1101/2021.06.13.448263v1)

## Quick Start<br/>
drtoolbox was downloaded from https://lvdmaaten.github.io/drtoolbox/<br/>
```bash
wget https://github.com/LiuJJ0327/CCPE/archive/refs/heads/main.zip
unzip CCPE-main.zip
cd CCPE-main/
matlab run.m
```
### Tansfer pseudotime to discrete stages<br/>
```bash
Rscript pseudotime_to_label.r 
```

## Applications and analyses of CCPE<br/>
The reproduction of the applications and analyses in our paper can be available at `reproduction/` <br/>
### 1. Pseudotime analysis<br/>
```bash
Rscript reproduction/Figure2/4_analysis_R/plot_pseudotime.r
```

### 2. Gene expression analysis (example: Aurka)<br/>
```bash
Rscript reproduction/Figure2/4_analysis_R/correlation.r
```

```bash
library(Seurat)
mesc<-read.table("./Figure2/1_mesc_Quartz_data/mESC_Quartz_preprocessed.txt",header=T,row.names = 1)
marrow <- CreateSeuratObject(raw.data  = mesc)
marrow@ident<-factor(marrow@ident,levels = c("G1","S","G2M"))
RidgePlot(object =marrow, features = 'Aurka')
```

### 3. Evaluation of the performance using then clustering metrics (example: E-MTAB-2805 mESCs data)<br/>
```bash
matlab estimate_mtrics/Evaluate.m
```
plot evaluation result of CCPE
```bash
library(ggplot2)
metrics<-<-read.csv("./Figure3/2_mesc_288/evaulate_mesc_avg.csv",header = T)
CCPE_metrics<-metrics[metrics$method=='CCPE',]
ggplot(CCPE_metrics,aes(metrics,value,fill=metrics))+geom_bar(stat="identity",position="dodge")
```

### 4. Differential gene expression analysis <br/>

### 5. UMAP plot of simulated dataset with dropouts<br/>

### 6. Cell cycle effect removal<br/>

