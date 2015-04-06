function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

adj = ones(size(theta));
adj(1,1) = 0;

one = ones(length(X),1);                            		% intialize one vector
z = X*theta;												% formulate z
h = one ./ (one + exp(-z));									% formulate hypothesis function
reg = (lambda*(theta.*theta).*adj)/(2*m);					% the regularization term

J = (-1/m)*sum(y.*log(h) + (one-y).*log(one-h)) + sum(reg);	% formulate cost function
grad = (1/m)* X'*(h-y) + (lambda/m)*adj.*theta;

% =============================================================

end
