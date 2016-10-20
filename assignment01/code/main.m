% # EFME 1. assignment
% # Koray Koska, 1528624

clc; % # clears console
close all; % # closes all windows of previous session
clear all; % # clear memory from previous session, this also erases breakpoints!

pkg load image; % # load image package

% # Hello World
% ## TASK 1: call your function "hello" here
sentence = hello('Susi', 'Maier');
disp(sentence);

% # Plotting
plotting(-10, 10, 0.1, 16, 2);

% # Matrices vs. Loops
[loopsTime, vectorizedTime] = vs(1, 1/(4*pi), 1/(4*pi), 512, 512);

% # Feature Extraction
% ## TASK 4.2
database = [extractFeatures('bunny.pgm'); extractFeatures('hand.pgm'); extractFeatures('dog.pgm')]';
% disp(database);
