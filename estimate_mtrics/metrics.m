Groundth=label';
Predict=mypredlabel';

RI = rand_index(Groundth, Predict);
ARI = rand_index(Groundth, Predict, 'adjusted');
NMI = NMI(Groundth, Predict);
Evaluate(Groundth,Predict);
[ micro, macro ] = micro_macro_PR(Predict,Groundth);
Accuracy=EVAL(1,1); 
Precision=macro.precision; 
Recall=macro.recall; 
Fscore=macro.fscore;

fprintf('RI=%.4f, ARI=%.4f, NMI=%.4f, Accuracy=%.4f, Precision=%.4f, Recall=%.4f, Fscore=%.4f\n', ...
    RI,ARI,NMI,Accuracy,Precision,Recall,Fscore);