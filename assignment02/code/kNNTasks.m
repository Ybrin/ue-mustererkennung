% EFME 2. assignment
% Koray Koska, 1528624

% k-NEAREST-NEIGHBOR (kNN)

%% Lily
[bestK, smallestError] = selectFeatures('Lily', testsetLily, trainingsetLily, [1:5], 1);
disp(['Lily: all features -> best k:' num2str(bestK) ' smallest error: ' num2str(smallestError)]);

% TASK1.3: find the best single feature and the best feature combination based on the classification error

%% Leafs
[bestK, smallestError] = selectFeatures ('Leafs', testsetLeafs, trainingsetLeafs, [1:15], 0);
disp(['Leafs: all features -> best k:' num2str(bestK) ' smallest error: ' num2str(smallestError)]);