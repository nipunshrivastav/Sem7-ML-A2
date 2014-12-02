function visualize()

load('mnist_bin38.mat')

%% Visualizing 1st example for each digit from test and train dataset

size = [28 28];

 for i=3:5:8
   varName = sprintf('test%d',i);
   cmd = [varName '(78,:)'];
   a = eval(cmd);
   figure, imshow(reshape(a,size));
 end