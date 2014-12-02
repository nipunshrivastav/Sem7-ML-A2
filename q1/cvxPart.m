function aMatrix = cvxPart(x,y,m) 

x1 = bsxfun(@times,x,y);
Q = x1*(x1)';
Q = 0.5*Q;
b = ones(m,1);
% model = runSVM(y,x);
% 
% [predict_label, accuracy, dec_values] = prediction(x,y, model, mailCount);

cvx_begin
variable aMatrix(m)
maximize(b'*aMatrix - aMatrix'*Q*aMatrix)
subject to
aMatrix >= 0
aMatrix <= 1
aMatrix'*y == 0
cvx_end