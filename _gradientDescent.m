function [theta, J_history] = _gradientDescent(X, y, theta, alpha, num_iters, m)
    J_history = zeros(num_iters, 1);
    for iter = 1:num_iters
        cost = _sigmoidFunction(X * theta) - y;
        theta = theta - ( (1/m) * cost' * X )' * alpha;
        J_history(iter) = _costFunction(X, y, theta, m);
    end
end
