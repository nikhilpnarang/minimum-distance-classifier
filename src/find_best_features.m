function [] = find_best_features(feature_train, label_train)
% FIND_BEST_FEATURES - Searches for the combination of two features that
% minimizes the classification error rate on the training data set
%
% Syntax: [] = find_best_features(feature_train, label_train)
%
% Inputs:
%    feature_train - training data
%    label_train - class labels corresponding to training data
%
% Outputs:
%    None
%
%------------------------------- BEGIN CODE -------------------------------

% compute the class means from the training data
class_means = train_classifier(feature_train, label_train);

% size of the feature space
n_features = size(feature_train, 2);

% preallocate the error rate array
feat_errors = ones(n_features, n_features);

% compute the error rate for non-repeating combinations of two features
for i = 1:n_features
    for j = i+1:n_features
        rate = run_classifier(class_means(:, [i j]), ...
            feature_train(:, [i j]), label_train);
        feat_errors(i, j) = rate;
    end
end

% compute the minimum error rate
best = min(min(feat_errors));

% compute the corresponding row and column of the minimum error rate
[row, col] = find(abs(feat_errors - best) == min(min(feat_errors - best)));

% print results
fprintf('Minimum Error Rate: %u\n', best)
fprintf('Best Features: %u and %u\n', row, col)

end

%------------------------------- END OF CODE ------------------------------
