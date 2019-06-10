function g = _sigmoidFunction(z)
    g = zeros(size(z));
    g = 1 ./ (1 + e.^-z);
    % g = 1.0 ./ (1.0 + exp(-z));
end