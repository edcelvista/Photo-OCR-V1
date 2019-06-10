function [theta, J_history] = _gradientDescentReg(X, y, theta, alpha, num_iters, m)
    J_history = zeros(num_iters, 1);
    lambda = 5;
    for iter = 1:num_iters
        cost = _sigmoidFunction(X * theta) - y;
        theta = theta - ( (1/m) * cost' * X )' * alpha;
        J_history(iter) = _costFunctionReg(X, y, theta, m, lambda);
    end
end
