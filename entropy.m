% Calculates an estimate of the entropy of a given set 's'
% Returns @e - The entropy of a given set.
function e = entropy(s)

% Returns the independent values within the classification column of the
% set.
uniqueVals = unique(s(:,5)); % Returns the independent values within the classification column of the set.
[nr, nc] = size(s); % @nr - number of rows in the set // nc  - Number of columns in the set.

classInstances = []; % Initiates the ClassIntance variable
purityInstances = []; % Initiates the purityInstances variable

for i = 1:length(uniqueVals) % Run loop for the number of unique values in the set
    % Returns the total number of each unique value present in the set
    classInstances(i) = sum(strcmp(uniqueVals(i),s(:,5)));
    
    % Calculates the number of unique instances in a set divided by number
    % of rows in given set
    purityInstances(i) = classInstances(i) / nr;
end

% Calculates the entropy of given set using the Gini Entropy forumlua 
% -Sum(Probability of instance appearing multiplied by log2 of probability
% of instance appearing.
e = -sum(purityInstances .* log2(purityInstances));
end