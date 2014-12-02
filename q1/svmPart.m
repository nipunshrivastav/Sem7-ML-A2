function [modelGauss, modelLinear, modelGauss_big, modelLinear_big] =  svmPart(x,y,x_big,y_big,x_test,y_test,x_test_big,y_test_big)

modelGauss = svmtrain(y, x, '-g 0.00025');

modelLinear = svmtrain(y, x, '-t 0');

modelGauss_big = svmtrain(y_big, x_big, '-g 0.00025');

modelLinear_big = svmtrain(y_big, x_big, '-t 0');


[predict_label_gauss, accuracy_gauss, prob_values_gauss] = svmpredict(y_test, x_test, modelGauss);

[predict_label_linear, accuracy_linear, prob_values_linear] = svmpredict(y_test, x_test, modelLinear);

[predict_label_gauss_big, accuracy_gauss_big, prob_values_gauss_big] = svmpredict(y_test_big, x_test_big, modelGauss_big);

[predict_label_linear_big, accuracy_linear_big, prob_values_linear_big] = svmpredict(y_test_big, x_test_big, modelLinear_big);