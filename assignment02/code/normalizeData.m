% EFME 2. assignment
% Koray Koska, 1528624

function [ normalizedData ] = normalizeData(data)
% INPUT
% data -> data set to be normalized

% OUTPUT
% normalizedData -> normalized data set

% TASK1.1: Implement this function to normalize data sets according to the formula
% provided in the assigment. DO NOT normalize the first row, it is the class label!

[rows, columns] = size(data);
normalizedData = zeros(rows, columns);
normalizedData(1, :) = data(1, :);
for r = 2:rows
    minFeature = min(data(r, :));
    maxFeature = max(data(r, :));
    normalizedFeature = (data(r, :) - minFeature) / (maxFeature - minFeature);
    
    normalizedData(r, :) = normalizedFeature;
end

% disp(normalizedData);

% disp(normalizedData);

% disp(data(2, :));
% disp('Normalized min max DATA:');
% disp([minLengthSepalum, maxLengthSepalum; minWidthSepalum, maxWidthSepalum; minLengthPetalum, maxLengthPetalum; minWidthPetalum, maxWidthPetalum]);
end

