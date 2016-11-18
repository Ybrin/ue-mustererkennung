% EFME 2. assignment
% Koray Koska, 1528624

function [classification] = kNN(testset, trainingset, k)
% INPUT
% testset -> samples to be classified
% trainingset -> samples in trainingset
% k -> size of neighborhood

% OUTPUT
% classification -> class labels for testset

% initialize output with zeros (for each sample in testset)
classification = zeros(size(testset,2),1);

% TASK1.2: implement kNN classifier on your own (use of knnsearch is forbidden!)
% distance metric: Euclidean, L2 norm

[rows, columns] = size(testset);
% disp(testset);
for column = 1:columns
    [tRows, tColumns] = size(trainingset);
    % rows and tRows MUST be the same
    % values = zeros(rows + 1, tColumns);
    values = zeros(1, tColumns);
    for tColumn = 1:tColumns
        inner = sum((testset(2:rows, column) - trainingset(2:tRows, tColumn)).^2);
        distance = sqrt(inner);
        
        % values(:, tColumn) = [trainingset(:, tColumn); distance];
        values(:, tColumn) = distance;
        
        % disp('DISTANCE');
        % disp(distance);
        % disp('COLUMN:');
        % disp(testset(2:rows, column));
        % disp('TCOLUMN')
        % disp(trainingset(:, tColumn));
    end
    % disp(values);
    
    [sortedValues,indices] = sort(values);
    
    cropped = indices(:, 1:k);
    % disp('DISPLAYING');
    % disp(k);
    % disp(cropped);
    
    nearests = zeros(1, k);
    for c = 1:k
       nearests(:, c) = trainingset(1, cropped(:, c));
    end
    
    % disp(nearests);
    
    classy = mode(nearests);
    
    % disp('CLASSY');
    % disp(classy);
    
    classification(column, :) = classy;
    
    % disp(sortedValues);
    % disp(indices);
end
% disp('CLASSIFICATION');
% disp(classification);
end