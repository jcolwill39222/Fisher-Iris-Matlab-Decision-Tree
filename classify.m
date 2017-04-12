

function classification = classify(tree, data)

currentNode = 1; % Monitors the current accessed node
classification = []; % Initiates the classification variable
rn = []; % Initiates the row number variable

% While no classification has been found for the given @data continue
% moving through the tree nodes in the tree structure.
while isempty(classification)
    
    % Returns the current row numbers for the current node
    rn = find(cell2mat(tree(:,1)) == currentNode);
    
    % Check if a decission rule exists on the current node
    if(~isempty(tree{rn(1),3})) 
        % Calculate if given index and variable passes or fails the rule
        % for this node. If pass go left if fail go right.
        if(data(1,tree{rn(1),3}(1,1)) <= tree{rn(1),3}(1,2))
            currentNode = tree{rn(1),7} % Sets the current node to the child node of current row in tree structure
        else
            currentNode = tree{rn(2),7} % Sets the current node to the child node of current row in tree structure
        end
    else
        classification = tree{rn(1),6}; % Returns the classification for the current node from tree structure
    end
end % End while loop

end % End function