% %% Start Predict %%
all_theta_trained = load('/Users/edcelvista/Downloads/_Machine Learning/_my_ocr/trainedParameters.csv');
correct   = 0;
incorrect = 0;
for i = 1:m,
    [val, index] = max(_sigmoidFunction(all_theta_trained * X(i,:)'));
    if index != y(i),
        incorrect++;
    else
        correct++;
    end
end

disp("Correct Guess: "), disp(correct)
disp("InCorrect Guess: "), disp(incorrect)
disp("Out of: "), disp(m)