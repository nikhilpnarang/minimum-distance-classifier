function [rate, errors] = run_classifier(class_means, features, labels)
% RUN_CLASSIFIER - Runs the minimum distance to class mean classifier on
% the provided data set and computes the overall error rate
%
% Syntax: [rate, errors] = run_classifier(class_means, features, labels)
%
% Inputs:
%    class_means - class means from data set training
%    features - training data
%    labels - class labels corresponding to training data
%
% Outputs:
%    rate - number of incorrect classifications / total samples
%    errors - array of incorrect classifications 
%
%------------------------------- BEGIN CODE -------------------------------

% compute the total number of samples in the data set
n_samples = length(features);

% total number of classes {1 ... n}
n_classes = max(unique(labels));

% compute the euclidean distances between every data sample and each of the 
% class means
distances = pdist2(features, class_means, 'euclidean');

% preallocate the per class error counts array
errors = zeros(1, n_classes);

% for each distance vector, increment error count if an incorrect
% classification occurs
for i = 1:n_samples
    indx = find(distances(i, :) == min(distances(i, :)));
    errors(labels(i)) = errors(labels(i)) + (indx ~= labels(i));
end

% compute the total error rate
rate = sum(errors) / n_samples;

end

%------------------------------- END OF CODE ------------------------------
