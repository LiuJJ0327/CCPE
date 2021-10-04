Groundth=label';
Predict=mypredlabel';

RI = rand_index(Groundth, Predict);
ARI = rand_index(Groundth, Predict, 'adjusted');
NMI = NMI(Groundth, Predict);
fprintf('RI=%.4f, ARI=%.4f, NMI=%.4f\n', ...
    RI,ARI,NMI);
Evaluate(Groundth,Predict);


%Groundth=A(:,1)';
%Predict=A(:,2)';