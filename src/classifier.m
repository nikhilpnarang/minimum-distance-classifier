function [] = classifier(feat_train, label_train, feat_test, label_test)
% CLASSIFIER - Trains the minimum distance to class mean classifier from a
% training set and then computes the error rate from a test set
%
% Syntax: [] = classifier(feat_train, label_train, feat_test, label_test)
%
% Inputs:
%    feat_train - training data
%    label_train - class labels corresponding to training data
%    feat_test - test data
%    label_test - class labels corresponding to test data
%
% Outputs:
%    None
%
%------------------------------- BEGIN CODE -------------------------------

% compute class means from the training set
class_means = train_classifier(feat_train, label_train);

% plot training set and compute error rate
plot_dec_boundaries(feat_train, label_train, class_means)
[rate, errors] = run_classifier(class_means, feat_train, label_train);

% print training set error rate
fprintf('Test Set Statistics\n')
fprintf('Error Rate: %f\n', rate)
for i = 1:length(errors)
   fprintf('Class %u Errors: %u\n', i, errors(i))
end

% plot test set and compute error rate
plot_dec_boundaries(feat_test, label_test, class_means)
[rate, errors] = run_classifier(class_means, feat_test, label_test);

% print test set error rate
fprintf('\n\nTraining Set Statistics\n')
fprintf('Error Rate: %f\n', rate)
for i = 1:length(errors)
   fprintf('Class %u Errors: %u\n', i, errors(i))
end

end

%------------------------------- END OF CODE ------------------------------
