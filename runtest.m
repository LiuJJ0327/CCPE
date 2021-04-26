load('testdata')
X=testdata;
X=log2(X+1);
[pseudotime] = CCPE(X);