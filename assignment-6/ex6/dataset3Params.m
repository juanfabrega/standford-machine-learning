function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%

% Vectors for different values of C and sigma to try
CVec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmaVec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% initializing a matrix for tracking error at each C,sigma combination.
errors = zeros(8, 8);

% nested for loops will return the error rate for every combination of C and sigma
% we use existing traning and gaussian kernel functions to get a model based on X y.
% we then use that model to predit values on a cross-validation set (Xval, yval).
% lastly each error rate is stored in the errors matrix to identify the best combo.
for i = 1:length(CVec)
  for j = 1:length(sigmaVec)
    model = svmTrain(X, y, CVec(i), @(x1, x2) gaussianKernel(x1, x2, sigmaVec(j)));
    predictions = svmPredict(model, Xval);
    errors(i, j) = mean(double(predictions ~= yval));
  end
end

% finding the minimum value of errors matrix and returning row/col indices.
minErrors = min(errors(:));
[row,col] = find(errors==minErrors);

% mapping C and sigma to corresponding row/col values for minimum error.
C = CVec(row);
sigma = sigmaVec(col);




% =========================================================================

end
