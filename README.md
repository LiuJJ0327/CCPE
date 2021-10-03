# CCPE
CCPE is a cell cycle pseudotime estimation method characterizing cell cycle timing from single-cell RNA-seq data. CCPE maps high-dimensional scRNA-seq data onto a helix in three-dimensional space, where 2D space is used to capture the cycle information in scRNA-seq data, and one dimension to predict the chronological orders of cells along the cycle, which we called cell cycle pseudotime. ScRNA-seq data is repeatedly transformed from high dimensional to low dimensional and then mapped back to high dimensional. At the same time, CCPE iteratively optimizes the discriminative dimensionality reduction via learning a helix until convergence (Figure 1). CCPE is applied to several downstream analyses and applications to demonstrate its ability to accurately estimate the cell cycle pseudotime and stages.<br/>

## Quick Start:<br/>
drtoolbox was downloaded from https://lvdmaaten.github.io/drtoolbox/<br/>
```bash
wget https://github.com/LiuJJ0327/CCPE/archive/refs/heads/main.zip<br/>
unzip CCPE-main.zip<br/>
cd CCPE-main/<br/>
matlab run.m<br/>
```
![image](https://github.com/LiuJJ0327/CCPE/blob/main/images/figure1.PNG)
