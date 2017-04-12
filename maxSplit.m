% Returns the best split and splitting rule of a given set based on the
% entropy and improvement gain for the new split sets.
function [set1,set2, rule] = maxSplit(set)

bestSplit = 0.0000000; % Initiate the bestSplit Variable, holds the current improvement gain to beat.

set1 = []; % Initiates a blank array for left set
set2 = []; % Initiates a blank array for right set
rule = []; % Initiates a blank array for splitting rules


for column = 1:size(set,2) - 1 
    for threshold = 1:0.1:max([set{:,column}])
       try
            [s1, s2] = split(set,column,threshold);
            improvementGain = gain(set,s1,s2);
            if improvementGain > bestSplit
                bestSplit = improvementGain;
                set1 = s1;
                set2 = s2;
                rule = [column, threshold];
            end  
       catch  
    end
    end
end