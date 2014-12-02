function aMatrix = cvxPartGauss(x,y,mailCount, gamma)


for i = 1:mailCount
    for j = 1:mailCount
        Q(i,j) = y(i).*y(j).*exp(-((norm(x(i,:)-x(j,:)))^2)*(gamma)); 
    end
end

b = ones(mailCount,1);

cvx_begin
variable aMatrix(mailCount)
maximize(b'*aMatrix - aMatrix'*(0.5*Q)*aMatrix)
subject to
aMatrix >= 0
aMatrix <= 1
aMatrix'*y == 0
cvx_end