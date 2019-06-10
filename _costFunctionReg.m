function [J, grad] = _costFunctionReg(X, y, theta, m, lambda)
    J = 0;
    grad = zeros(size(theta));
    h = _sigmoidFunction(X * theta);
    % intercept theta should be reseted to 0 before regularization process
    theta_reg = [0;theta(2:end, :);];
    J = (1/m)*(-y'* log(h) - (1 - y)'*log(1-h))+(lambda/(2*m))*theta_reg'*theta_reg; % theta_reg' * theta_reg = squared
    grad = (1/m)*(X'*(h-y)+lambda*theta_reg);
end