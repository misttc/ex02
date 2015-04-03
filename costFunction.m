function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%

one = ones(length(X),1);                            % intialize one vector
z = X*theta;										% formulate z
h = one ./ (one + exp(-z));							% formulate hypothesis function
J = -1/m*sum(y.*log(h) + (one-y).*log(one-h));		% formulate cost function

grad = 1/m * X'*(h-y);

% for iter = 1:num_iters
%	grad(iter) = 1/m * sum(X(:,iter).*(h-y));
% end


% =============================================================

end