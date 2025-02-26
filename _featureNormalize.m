function [X_norm, mu, sigma] = _featureNormalize(X)
    X_norm = X;
    mu = zeros(1, size(X, 2));
    sigma = zeros(1, size(X, 2));

    mu    = mean(X);
    sigma = std(X);

    indicies = 1:size(X, 2);

    for i = indicies,
    XminusMu  = X(:, i) - mu(i);
    X_norm(:, i) = XminusMu / sigma(i);
end