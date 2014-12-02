function b = findb(aMatrix,y,x, mailCount, gamma)


for i = 1:mailCount
    if(aMatrix(i)>0.0001 && aMatrix(i)<1)
        yOne = y(1);
        xOne = x(1,:);
    end
end

sum = 0;

for i = 1:mailCount
    if (aMatrix(i)>0.0001)
        sum = sum + aMatrix(i)*y(i)*exp(-((norm(x(i,:)-xOne))^2)*(gamma));
                                 
    end 
end


b = yOne - sum;