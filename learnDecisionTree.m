
% This function creates and returns a Decession Tree based on two intial
% datasets of data points and classification variables.
% @ts - Returns a Decision Tree Structure
% Arguments:
% @Matrix - a n x n matrix of integers
% @Classification - String classification of class data is assigned to
function ts = learnDecisionTree(matrix, classification)

% Initiates the initial dataset combining the meas matrix, and specicies
% into a cell array.
os = [num2cell(matrix) classification];

% Tree Structure Cell Array - Creates a 1 by 7 empty cell array
% Structure format: 
% Current Node | Current Dataset | Rule | Left/Right | Returned Set | Class
% | Child Node
ts = cell(1,7); 

node = 1; % Tracks the current accessed node in the tree structure


count = 1; % Identifies the current Row in the Tree Structure
childNode = 2; % Identifies the child node of the current node

% @queue - Manages the next set to be split by the maxSplit function
% Queue is initiated with the initial dataset as this is the first set to
% be split, then continually populated as the application is ran.
queue{1,1} = os;

% While loop continues to run whilst @queue still contains a set.
while ~isempty(queue)
    
    % Calls the maxSplit function passing the first element (set) from the
    % queue to be split.
    % Returns: 
    % @s1 - Left Set split
    % @s2 - Right Set Split
    % @rule - The rule used to split the sets.
    [s1,s2, rule] = maxSplit(queue{1});  
    
        % Performs a check if @s1 is empty - Used for left Split
        if(isempty(s1))
            % Sets the current count row in the Tree Structure using the
            % tree structure format.
            % Sets the returned split set value to the parents left split.
            % Child node is set to blank and no further splits can be made.
            ts(count, :) = {node, queue{1}, rule, 1,ts{count - node,5}, majority(queue{1}),[]};
            
            count = count + 1; % Increase Row count by 1
            
        else % Used for successful Left split
            % Sets the current count row in the Tree Structure using the
            % tree structure format.
            ts(count, :) = {node, queue{1}, rule, 1, s1, majority(s1), childNode};
            
            count = count + 1;
            
            childNode = childNode + 1; % Increases the child node by 1
        end % Ends @s1 empty check
        
        if(~isempty(s2)) % Checks if @s2 is not empty
            ts(count, :) = {node, queue{1}, rule, 2, s2, majority(s2), childNode};
            count = count + 1;
            childNode = childNode + 1;
        end % Ends @s2 not empty check

        % If @s1 is not empty then add @s1 and @s2 to the split queue
        if(~isempty(s1))
            queue = [queue; {s1}];
            queue = [queue; {s2}];
        end 
   
    queue(1,:) = []; % Remove the current 1st set from the queue
 
    node = node + 1; % Increases the current node by 1
end % Ends while Queue is not empty loop

end % Function end