function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);
centroids;
X;
% set length of X
m = size(X, 1);
% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
% create matrix of distances to each k centroid per each example size m x K
distances = zeros(m, K);

% iterating through all centroids and placing square distance of each training
% example in the column corresponding to the centroid. We will use this to
% pick the smallest distance for each training example to a centroid. (Filling
% our distances matrix)
for i = 1:K
  distances(:, i) = sum((X - centroids(i, :)).^2, 2);
end

% we now iterate through each row in the distances matrix (each row corresponds
% to a training example) to find the lowest distance to a centroid (column in matrix)
% with lowest distance found, we place the index of that column in  our idx vector.
% columns in our matrix map to centroids.
for j = 1:m
  [smallest, idx(j)] = min(distances(j, :));
end






% =============================================================

end
