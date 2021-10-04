function EVAL = Evaluate(ACTUAL,PREDICTED)
% This fucntion evaluates the performance of a classification model by 
% calculating the common performance measures: Accuracy, Sensitivity, 
% Specificity, Precision, Recall, F-Measure, G-mean.
% Input: ACTUAL = Column matrix with actual class labels of the training
%                 examples
%        PREDICTED = Column matrix with predicted class labels by the
%                    classification model
% Output: EVAL = Row matrix with all the performance measures


idx = (ACTUAL()==1);

p = length(ACTUAL(idx));
n = length(ACTUAL(~idx));
N = p+n;

tp = sum(ACTUAL(idx)==PREDICTED(idx));
tn = sum(ACTUAL(~idx)==PREDICTED(~idx));
fp = n-tn;
fn = p-tp;

tp_rate = tp/p;
tn_rate = tn/n;

accuracy = (tp+tn)/N;
sensitivity = tp_rate; %�?感性：真阳性率
specificity = tn_rate; %特异性：真阴性率
precision = tp/(tp+fp);
recall = sensitivity;
f_measure = 2*((precision*recall)/(precision + recall));
gmean = sqrt(tp_rate*tn_rate);
Jaccard=tp/(tp+fn+fp); %Jaccard系数

EVAL = [accuracy sensitivity specificity precision recall f_measure gmean Jaccard];
fprintf('accuracy=%.4f, sensitivity=%.4f, specificity=%.4f, precision=%.4f, recall=%.4f, f_measure=%.4f, gmean=%.4f,,Jaccard=%.4f\n',accuracy, sensitivity, specificity, precision, recall, f_measure, gmean,Jaccard);
end