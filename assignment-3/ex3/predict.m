function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% Add a column of ones to the X matrix.
X = [ones(m, 1) X];

% calculate z values for every 'neuron'(unit) in hidden layer (25 units)
z_two = X * Theta1';

% Run activation function on each unit in hidden layer
a_two = sigmoid(z_two);

% adding a row of ones to the hidden layer output to match Theta2.
a_two = [ones(size(a_two, 1), 1) a_two];

% calculate z calues for every output unit in third (last) layer
z_three = a_two * Theta2';

% Run activation function on each unit of output layer.
a_three = sigmoid(z_three);

% predicting value based on maximum value of each output layer.
[maximums, p] = max(a_three');

% Making p a row vector.
p = p';
% =========================================================================


end
