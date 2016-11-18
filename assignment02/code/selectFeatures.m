% EFME 2. assignment
% Koray Koska, 1528624

function [bestK, smallestError] = selectFeatures (nameOfSet, testset, trainingset, features, plotFlag)
% INPUT
% nameOfSet -> name of dataset (string)
% testset -> matrix containing the test samples
% trainingset -> matrix containing the training samples
% features -> indizes of selected features, 1 = class label
% plotFlag -> 1 = plot result, 0 = do not plot result

% OUTPUT 
% bestK -> neighborhood size which lead to smallest error
% smallestError -> smallest error in %

k = 1 : 2 : 21; % test for different k
errorskNN = zeros(length(k),1); % store error of each k

% select data corresponding to features from sets
testset = testset([features],:);
trainingset = trainingset([features],:);

for i = 1 : length(k)
    % classify
    [classificationkNN] = kNN(testset, trainingset, k(i));
    % evaluate
    errorskNN(i) = evaluate(classificationkNN, testset(1,:));
    % debug output
    %disp(['kNN wrongly classified ', sprintf('%.2f',errorskNN(i)), '% of Testset with k = ', sprintf('%d',k(i)), '.']);
end

% draw error in % over different k
if plotFlag
  figure;
  hold on;
  title(['Error of kNN in % for ' nameOfSet ' dataset']);
  xlabel('value of k'); % x-axis label
  ylabel('error in %'); % y-axis label
  axis([k(1),k(length(k)),0,max(errorskNN)]); % limits of axis
  plot(k,errorskNN,':r*','linewidth', 2);
  hold off;
end

[smallestError, index] = min(errorskNN);
bestK = k(index);

end