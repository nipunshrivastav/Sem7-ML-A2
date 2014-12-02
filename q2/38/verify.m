function res = verify(w1,w2,test,test_label,test_size)

res = 0;

for i = 1:test_size
    input_h = test(i,:)*w1;
    output_h = [1 1./(1 + exp(-input_h))];
    
    input_o = output_h*w2;
    output_o = threshold([1./(1 + exp(-input_o))]);
    
   a=test_label(i,:);
    
    if (isequal(output_o,test_label(i,:)))
        res = res+1;
    end
    
end

res = res/test_size*100;