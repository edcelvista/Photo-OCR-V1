% %% Start Predict %%
all_theta_trained = load('/Users/edcelvista/Downloads/_Machine Learning/_my_ocr/trainedParameters.csv');
dataT = load('/Users/edcelvista/Downloads/_Machine Learning/_my_ocr/kaggle-handwritten/test.csv');
XT = dataT(:, [1: 784]); [mT, nT] = size(XT);
XT = [ones(mT, 1) XT]; % intercept 
ansMatrix = [];
for i = 1:mT,
    [val, index] = max(_sigmoidFunction(all_theta_trained * XT(i,:)'));
    ansMatrix = [ansMatrix;i index];
end

csvwrite ("submission.csv", ansMatrix);