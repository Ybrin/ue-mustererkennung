% EFME 2. assignment
% Koray Koska, 1528624

clc; % clears console
close all; % closes all windows of previous session
clear all; % clear memory from previous session, this also erases breakpoints!

%% READ Lily dataset
file = fopen('datasetLily.txt');
datasetLily = textscan(file, '%f %f %f %f %f');
fclose(file);
% convert to matrix for easier handling
% trainingset: 5 x 100 -> rows: 1 class label, 4 features | colums: 100 samples
datasetLily = cell2mat(datasetLily)';
datasetLily = normalizeData(datasetLily);
% trainingset
trainingsetLily = [datasetLily(:,1:25), datasetLily(:,51:75)];
% testset
testsetLily = [datasetLily(:,26:50), datasetLily(:,76:100)];

%% READ Leaf dataset
file = fopen('trainingsetLeafs.txt');
trainingsetLeafs = textscan(file, '%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f');
fclose(file);
file = fopen('testsetLeafs.txt');
testsetLeafs = textscan(file, '%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f');
fclose(file);
% convert to matrix for easier handling
% trainingset: 15 x 176 -> rows: 1 class label, 14 features | colums: 176 samples
trainingsetLeafs = cell2mat(trainingsetLeafs)';
% testset: 15 x 164 -> rows: 1 class label, 14 features | colums: 164 samples
testsetLeafs = cell2mat(testsetLeafs)';
% normalize sets
trainingsetLeafs = normalizeData(trainingsetLeafs);
testsetLeafs = normalizeData(testsetLeafs);

%% kNN
kNNTasks

%% Bayes Theorem
% bayesTasks