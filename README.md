# CCPE

## Introduction
CCPE is a cell cycle pseudotime estimation method characterizing cell cycle timing from single-cell RNA-seq data. CCPE maps high-dimensional scRNA-seq data onto a helix in three-dimensional space, where 2D space is used to capture the cycle information in scRNA-seq data, and one dimension to predict the chronological orders of cells along the cycle, which we called cell cycle pseudotime. ScRNA-seq data is repeatedly transformed from high dimensional to low dimensional and then mapped back to high dimensional. At the same time, CCPE iteratively optimizes the discriminative dimensionality reduction via learning a helix until convergence (Figure 1). CCPE is applied to several downstream analyses and applications to demonstrate its ability to accurately estimate the cell cycle pseudotime and stages.<br/>
![image](https://github.com/LiuJJ0327/CCPE/blob/main/images/figure1.PNG)
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

## Applications and analyses of CCPE:<br/>
