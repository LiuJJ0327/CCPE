load('mesc_processed.mat')
lambda=50;
gamma=50;
sigma=0.001;  %Gaussian distribution
[pseudotime] = CCPE(X,lambda,gamma,sigma);
