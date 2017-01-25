# Minimum Distance to Class Mean Classifier

This repository implements a minimum distance to class mean classifier using Euclidean distances. The classifier is implemented in the `classifier.m` file, which calls `train_classifier.m` in order to train the classifier using provided training sets and then calls `run_classifier.m` in order to run the classifier against a test set and determine an error rate. Additionally, the samples of the training set, resulting class means, decision boundaries, and decision regions can be plotted using `plot_dec_boundaries.m`.

The training set can be tested on three different data sets: `synthetic1.mat`, `synthetic2.mat`, and `wine.mat`. The third data set was obtained from the UCI machine learning repository (http://archive.ics.uci.edu/ml/datasets/Wine). The `wine.mat` dataset is used to classify the cultivar of the grape plant a wine was made from, given measured attributes of the wine. Unlike the first two data sets, `wine.mat` contains 13 different features, so `find_best_features.m` can be used to narrow down the two best features to use for classification using the minimum distance to class mean classifier. 

### Implementation

- Load data set <name.mat>: `load('data/<name.mat>')`
- Classify set with 2 features: `classifier(feature_train, label_train, feature_test, label_test)`
- Classify set with more than 2 features (use f1 and f2): `classifier(feature_train(:, [f1 f2]), label_train, feature_test(:, [f1 f2]), label_test)`
- Find the best features if more than 2 are available: `find_best_features(feature_train, label_train)`
