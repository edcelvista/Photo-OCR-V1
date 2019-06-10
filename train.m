if (exist ("data", "var") == 0)
  clc; close all; clear all;
  data = load('/Users/edcelvista/Downloads/_Machine Learning/_my_ocr/data/grayscaledData.csv');
  X = data(:, 2:end);
  y = data(:, 1);
  
  disp("Feature Normalizing....");
  % [X, mean_, sigma_] = _featureNormalize(X);
  [m, n] = size(X);

  perLabel_theta = zeros(1, n);
  perLabel_theta = perLabel_theta';

  numLabel = 10;
  allLabel_theta = zeros(numLabel, n); % don't transpose
  
  % intercepts
  perLabel_theta = [perLabel_theta; zeros(1, 1)]; % append 1 x 1 row wise
  allLabel_theta = [allLabel_theta, zeros(numLabel, 1)]; % append 10 x 1 col wise
  X = [X, zeros(m, 1)];

else
  disp("Data Is Already Loaded..Ingoring");
end


disp("Training Starts...");
lambda = 3;
interations = 300;
options = optimset('GradObj', 'on', 'MaxIter', interations);
for c = 1:numLabel,
  [theta, fval, exitflag] = _fmincg(@(t)(_costFunctionReg(X, (y==c), t, m, lambda)), perLabel_theta, options);
  allLabel_theta(c, :) = theta';
  plot(fval)
end

disp("Writing Theta...");
csvwrite('trainedParameters.csv', allLabel_theta);