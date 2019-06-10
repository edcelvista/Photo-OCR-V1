function [J, grad] = _costFunction(X, y, theta, m)
    J = 0;
    grad = zeros(size(theta));
    h = _sigmoidFunction(X * theta);
    J = (1/m)*(-y'* log(h) - (1 - y)'* log(1-h));
    grad = (1/m) * X' * (h - y);
end