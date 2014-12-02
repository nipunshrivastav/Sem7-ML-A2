function [w, b] = findwb(aMatrix,y,x, mailCount)

ay = aMatrix.*y;
whelp = bsxfun(@times,x,ay);

for i = 1:size(whelp,2)
    w(i) = sum(whelp(:,i));
end

counter = 0;
b = 0;

for i = 1:mailCount
    if(aMatrix(i)>0.0001 && aMatrix(i)<1)
        counter = counter+1;
        z = x(i,:);
        b = b + y(i) - w*z';
    end
end


b = b/counter;