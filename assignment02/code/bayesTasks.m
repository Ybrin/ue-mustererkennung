% EFME 2. assignment
% Koray Koska, 1528624

% BAYES THEOREM

% priors P(w1) and P(w2)
priorW1 = 0.5;
priorW2 = 0.5;

% parameters of class conditional pdfs p(X|w1) und p(X|w2)
% -> assume normal (Gaussian) distribution

% means
meanW1 = 2;
meanW2 = 4;

% variances
varW1 = 2;
varW2 = 2;

% find suitable interval for drawing depending on means and variances
maxX = max(meanW1+4*sqrt(varW1),meanW2+4*sqrt(varW2));
minX = min(meanW1-4*sqrt(varW1),meanW2-4*sqrt(varW2));
X = minX:0.001:maxX;

% determine  weighted likelihoods for interval X
% TASK 2.1 -> go to function file: determineWeightedLikelihood
weightedLikelihoodW1 = determineWeightedLikelihood(meanW1, varW1, priorW1, X);
weightedLikelihoodW2 = determineWeightedLikelihood(meanW2, varW2, priorW2, X);

% draw likelihoods for interval X
figure;
title('Weighted class conditional pdfs p(X|w1)*P(w1) and p(X|w2)*P(w2)');
hold on;
% plot weighted class conditional pdfs w1
plot(X, weightedLikelihoodW1, 'b','linewidth', 2);
% plot weighted class conditional pdfs w2
plot(X, weightedLikelihoodW2, 'g','linewidth', 2);
xlabel('X');
ylabel('Likelihood');
legend ('w1', 'w2');
hold off;

% determine evidence for interval X
% Task 2.2 -> go to function file: determineEvidence
evidence = determineEvidence(weightedLikelihoodW1, weightedLikelihoodW2);

% draw evidence
figure;
title('Evidence p(X)');
hold on;
plot(X, evidence, 'k','linewidth', 2);
xlabel('X');
ylabel('Evidence');
legend ('evidence');
hold off;

% determine posteriors for interval X
% TASK 2.3.1 -> go to function file: determinePosterior
posteriorW1 = determinePosterior(weightedLikelihoodW1, evidence);
posteriorW2 = determinePosterior(weightedLikelihoodW2, evidence);

% draw posteriors for interval X
figure;
hold on;
title('A posteriori probabilities P(w1|X) and P(w2|X), and conditional error');
% plot posterior w1
plot(X, posteriorW1, 'b','linewidth', 2);
% plot posterior w2
plot(X, posteriorW2, 'g','linewidth', 2);

% Bayes decision rule for interval X
% TASK 2.3.2 -> got to function file: bayesDecision
classificationBayes = bayesDecision(posteriorW1, posteriorW2);

% determine conditional error P(error|X) for interval X
% TASK 2.4 -> go to function file: 
conditionalError = determineError(posteriorW1, posteriorW2, classificationBayes);

%plot conditional error P(error|X) for interval X
fill([X fliplr(X)], [conditionalError zeros(1,size(conditionalError,2))], 'r', 'edgecolor','r');
xlabel('X');
ylabel('Posterior');
legend ('w1', 'w2', 'error');
hold off;