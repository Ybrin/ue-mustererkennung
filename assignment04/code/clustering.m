% EFME 4. assignment
% Koray Koska, 1528624

% load data and pre-processing
% Task 1.1


%% READ Aggregation.txt dataset
file = fopen('datasets/Aggregation.txt');
datasetAggregation = textscan(file, '%f %f %f');
fclose(file);
% convert to matrix for easier handling
datasetAggregation = cell2mat(datasetAggregation);
datasetAggregationOrigLabels = datasetAggregation(:, 3);
datasetAggregation = datasetAggregation(:, 1:2);

file = fopen('datasets/R15.txt');
datasetR15 = textscan(file, '%f %f %f');
fclose(file);
% convert to matrix for easier handling
datasetR15 = cell2mat(datasetR15);
datasetR15OrigLabels = datasetR15(:, 3);
datasetR15 = datasetR15(:, 1:2);

file = fopen('datasets/Pathbased.txt');
datasetD31 = textscan(file, '%f %f %f');
fclose(file);
% convert to matrix for easier handling
datasetD31 = cell2mat(datasetD31);
datasetD31OrigLabels = datasetD31(:, 3);
datasetD31 = datasetD31(:, 1:2);

% disp(datasetAggregation(:, 1:2));
% disp(datasetAggregation);


% cluster datasets: k-Means
% Task 1.2

% disp(size(datasetAggregation, 1));

resAggr = kmeansClustering(datasetAggregation, 7);
resAggrMedian = kmedianClustering(datasetAggregation, 7);
% disp(res);

resR15 = kmeansClustering(datasetR15, 15);
resR15Median = kmedianClustering(datasetR15, 15);
% disp(resR15);

resD31 = kmeansClustering(datasetD31, 3);
resD31Median = kmedianClustering(datasetD31, 3);
% disp(resD31);

% cluster datasets: Agglomerative
% Task 1.3

aggResAggr = clusterdata(datasetAggregation, 'distance', 'euclidean', 'maxclust', 7);
% disp(aggResAggr);

aggResR15 = clusterdata(datasetR15, 'distance', 'euclidean', 'maxclust', 15);
% disp(aggResR15);

aggResD31 = clusterdata(datasetD31, 'distance', 'euclidean', 'maxclust', 3);
% disp(aggResD31);

figure;
x = datasetAggregation(:, 1);
y = datasetAggregation(:, 2);
subplot(4, 1, 1);
c = datasetAggregationOrigLabels;
gscatter(x, y, c);
title('Original datasetAggregation');

c = resAggr;
subplot(4, 1, 2);
gscatter(x, y, c);
title('kMeans datasetAggregation');

c = aggResAggr;
subplot(4, 1, 3);
gscatter(x, y, c);
title('Agglomerative datasetAggregation');

c = resAggrMedian;
subplot(4, 1, 4);
gscatter(x, y, c);
title('kMedian datasetAggregation');


figure;
x = datasetR15(:, 1);
y = datasetR15(:, 2);
subplot(4, 1, 1);
c = datasetR15OrigLabels;
gscatter(x, y, c);
title('Original datasetR15');

c = resR15;
subplot(4, 1, 2);
gscatter(x, y, c);
title('kMeans datasetR15');

c = aggResR15;
subplot(4, 1, 3);
gscatter(x, y, c);
title('Agglomerative datasetR15');

c = resR15Median;
subplot(4, 1, 4);
gscatter(x, y, c);
title('kMedian datasetR15');


figure;
x = datasetD31(:, 1);
y = datasetD31(:, 2);
subplot(4, 1, 1);
c = datasetD31OrigLabels;
gscatter(x, y, c);
title('Original datasetPathbased');

c = resD31;
subplot(4, 1, 2);
gscatter(x, y, c);
title('kMeans datasetPathbased');

c = aggResD31;
subplot(4, 1, 3);
gscatter(x, y, c);
title('Agglomerative datasetPathbased');

c = resD31Median;
subplot(4, 1, 4);
gscatter(x, y, c);
title('kMedian datasetPathbased');

% show it all
% Task 1.4

%%% Bonus Task
% cluster datasets: k-Median
% Task 2.1

% show it all
% Task 2.2