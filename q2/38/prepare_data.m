function [test, train, test_label, train_label, test_size, train_size, feature_length, number_of_classes] = prepare_data(test, train, test_label, train_label, test_size, train_size, feature_length, number_of_classes)

test = double([(ones(test_size,1)*255) test]);
train = double([(ones(train_size,1)*255) train]);

    % de2bi gives vector in opposite order
    
train_label(train_label==3) = 0;
train_label(train_label==8) = 1;

test_label(test_label==3) = 0;
test_label(test_label==8) = 1;