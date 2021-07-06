load('testdata')
X=testdata;
X=log2(X+1);
lambda=50;
gamma=50;
sigma=0.001;  %Gaussian distribution
[pseudotime] = CCPE(X,lambda,gamma,sigma);
