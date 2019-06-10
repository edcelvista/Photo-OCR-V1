clc; close all; clear all;
disp("Loading Image Modules..");
pkg load image
rootDir = '/Users/edcelvista/Downloads/_Machine Learning/_my_ocr/data/trainingSet';
[FILES, ERR, MSG] = readdir (rootDir);

grayscaledData = [];
for i = FILES{[4, :], 1} : FILES{[:, end],1}
    label = i;
    perClassDir = strcat(rootDir,'/',num2str(i), '/');
    [perClassFILES, perClassERR, perClassMSG] = readdir (perClassDir);
    [filesCount, filesCountn] = size(perClassFILES);
    for j = 3 : filesCount
        perFilePath = strtrim(strcat(perClassDir, disp(perClassFILES{[j, :], 1})));
        img = imread(perFilePath);
        indexImgVector = img(:)';
        withLabelIndexImg = [str2num(label), indexImgVector];
        grayscaledData = [grayscaledData;withLabelIndexImg];
    endfor
endfor

csvwrite('grayscaledData.csv', grayscaledData);