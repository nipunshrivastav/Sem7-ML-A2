function [predict_label, accuracy, dec_values] = prediction(x,y, model, mailCount)


a = zeros(mailCount,1);
[predict_label, accuracy, dec_values] = svmpredict(y, x, model);
[predict_label, accuracy, dec_values] = svmpredict(a, x, model);