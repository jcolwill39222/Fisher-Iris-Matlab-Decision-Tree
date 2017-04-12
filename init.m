
load fisheriris %Load the Fisher Iris data set

% Calls the learnDecisionTree function taking elements from the Fisheriris
% data set.
% @Returns t - Tree Structure Cell Array
t = learnDecisionTree(meas,species)

% Calls the classify function which takes the following arguements
% @t - Decision Tree Structure
% @[1,2,3,4] - A 1x4 Matrix of integer data to classify.
%
% Returns the Classification of the given data set. Optionally can return
% the node path through the tree structure.
classify(t, [4,22,11,25])

