close all;
clear all;
clc;

%% Visualizing
%visualize();

%% Processing dataset
[test, train, test_label, train_label, test_size, train_size, feature_length, number_of_classes] = process_data();

%% Preparing dataset
[test, train, test_label, train_label, test_size, train_size, feature_length, number_of_classes] = prepare_data(test, train, test_label, train_label, test_size, train_size, feature_length, number_of_classes);

test = test/255; train = train/255;


 %% Neural Network
 
 i = feature_length;% input
 h = 100;% hidden_layer_neurons
 o = ceil(log2(number_of_classes)); %output
 eta = 1; % Learning Rate
 
 w1 = 2 * rand(i+1,h) - 1;% Weights and Bias between input layer and hidden layer
 w2 = 2 * rand(h+1,o) - 1;% Weights and Bias between hidden layer and output layer

 
 d_w1 = zeros(i+1,h);
 d_w2 = zeros(h+1,o);

 
 output_h = [1 zeros(1,h)]; %output at hidden layer 
 output_o = zeros(1,o); %output at output layer
 
 d_h = zeros(1,h+1);% slope and error product at hidden
 d_o = zeros(1,o); % slope and error product at output
 
 error = 2;
 round = 0;
 iter = 0;
 errorNew = 0;

 while (error > 0.005)
     error = 0;
     round = round+1

     iter = iter+1;
     eta = 1/(sqrt(iter));

     errorOld = errorNew;
     errorOld/train_size
     errorNew = 0;

     a = randperm(train_size);
     %pause;
     % dnt accumulate the error of whole data set
     for k = 1:train_size


         input_h = train(a(k),:)*w1;
         output_h = [1 1./(1 + exp(-input_h))];
         input_o = output_h*w2;
         output_o = 1./(1 + exp(-input_o));

         err = train_label(a(k),:) - output_o;
         d_o = output_o.*(1-output_o).*err;

         for j = 1:h+1
             d_w2(j,:) = d_o*output_h(j);
         end

         w2 = w2 + eta * d_w2;


         for j = 2:h+1
             d_h(j) = (d_o*w2(j,:)')*output_h(j)*(1-output_h(j));
         end

         for j = 1:i+1
             d_w1(j,:) = d_h(2:h+1)*train(a(k),j);
         end

         w1 = w1 + eta * d_w1;

         z = sum(err.^2);
         errorNew = errorNew + z;

%
%          if ((1)&&(mod(k,100)==0))
%               z
%               %error
%          end
     end
     
     error = abs(errorOld - errorNew)/train_size
     %pause;

 end

accuracy = verify(w1,w2,test,test_label,test_size)