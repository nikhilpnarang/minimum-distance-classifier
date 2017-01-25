function [class_means] = train_classifier(feature_train, label_train)
% TRAIN_CLASSIFIER - Output class means for the minimum distance to class
% mean classifier with n classes and m features
%
% Syntax: [class_means] = train_classifier(feature_train, label_train)
%
% Inputs:
%    feature_train - training data
%    label_train - class labels corresponding to training data
%
% Outputs:
%    class_means - means of all features in each class
%
%------------------------------- BEGIN CODE -------------------------------

% total number of classes {1 ... n}
n_classes = max(unique(label_train));

% size of the feature space
m_features = size(feature_train, 2);

% preallocate sample mean array
class_means = zeros(n_classes, m_features);

% calculate mean x and y values for each class
for i = 1:n_classes
    class_means(i,:) = mean(feature_train(label_train == i, :));
end

end

%------------------------------- END OF CODE ------------------------------
