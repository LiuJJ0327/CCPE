clear NMI;
%load('hESC_labels.mat')
mm=[];
Groundth=cyclone416';
Predict=CCPEunsuperisedlabel';
RI = rand_index(Groundth, Predict);
ARI = rand_index(Groundth, Predict, 'adjusted');
NMI = NMI(Groundth, Predict);
fprintf('RI=%.4f, ARI=%.4f, NMI=%.4f\n', ...
    RI,ARI,NMI);
EVAL = Evaluate(Groundth,Predict);

mm(1,1)=EVAL(1,1); %accuracy
mm(2,1)=EVAL(1,3); %specificity
mm(3,1)=EVAL(1,4); %precision
mm(4,1)=EVAL(1,5); %recall
mm(5,1)=EVAL(1,6); %f_measure
mm(6,1)=EVAL(1,7);  %gmean
mm(7,1)=EVAL(1,8); %Jaccard
mm(8,1)=RI;
mm(9,1)=ARI;
mm(10,1)=NMI;


%mm(1,1)=RI;
%mm(1,2)=ARI;
%mm(1,3)=NMI;
%mm(1,4)=EVAL(1,1); %accuracy
%mm(1,5)=EVAL(1,3); %specificity
%mm(1,6)=EVAL(1,4); %precision
%mm(1,7)=EVAL(1,5); %recall
%mm(1,8)=EVAL(1,6); %f_measure
%mm(1,9)=EVAL(1,7);  %gmean
%mm(1,10)=EVAL(1,8); %Jaccard

