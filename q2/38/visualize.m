function visualize()

load('mnist_all.mat')

%% Visualizing 1st example for each digit from test and train dataset

size = [28 28];

i = input('Enter the number you want to see from test data set: ');

j = input('Enter the example number you want to see for the specified above: : ');

varName = sprintf('test%d(%d,:)',i,j);
cmd = [varName ';'];
a = eval(cmd);
figure, imshow((reshape(a,size))');