function sum = findVal(x, xTrain, aMatrix, yTrain, gamma, mailCount)

sum = 0;

for i = 1:mailCount
    if(aMatrix(i)>0.0001)
        q = aMatrix(i)*yTrain(i)*exp(-((norm(xTrain(i,:)-x))^2)*(gamma));
        sum = sum + q;
    end
end