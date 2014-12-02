function [test, train, test_label, train_label, test_size, train_size, feature_length, number_of_classes] = process_data()

load('mnist_all.mat')

feature_length = size(train3,2);
curren_length = 0;current_index = 1;
curren_length2 = 0;current_index2 = 1;
number_of_classes = 0;

 for i=0:9
     number_of_classes = number_of_classes+1;
   varName = sprintf('train%d',i);
   cmd = [varName ';'];
   temp = eval(cmd);
   
   current_length = size(temp,1)
   train_label(current_index:current_index+current_length-1) = i;
   current_index = current_index+current_length;
   
   if (i == 0)
       train = temp;
   else
       train = cat(1,train,temp);
   end
   
   varName2 = sprintf('test%d',i);
   cmd = [varName2 ';'];
   temp2 = eval(cmd);
   
   current_length2 = size(temp2,1);
   test_label(current_index2:current_index2+current_length2-1) = i;
   current_index2 = current_index2+current_length2;
   
   if (i == 0)
       test = temp2;
   else
       test = cat(1,test,temp2);
   end
 end
 
 test_size = current_index2 - 1;
 train_size = current_index - 1;
 