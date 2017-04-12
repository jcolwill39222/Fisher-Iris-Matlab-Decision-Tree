
% Returns the majority classification of a given set
function majorityClass = majority(s)

try
classifications = s(:,5); % Retrieves all classifications in the set @s

uniqueNames=unique(classifications)'; % find the unique classifications

% Calculate the number of occurences of each classification using the
% string compare function.
occurrences=strcmpi(classifications(:,ones(1,length(uniqueNames))),uniqueNames(ones(length(classifications),1),:));

counts=sum(occurrences,1); % Counts the number of occurences

% Returns the max value @x and it's position in the uniqueNames matrix @i
[x,i] = max(counts);

majorityClass = uniqueNames{i}; % Sets the majorityClass result to the value of the element at position @i
catch % If error then return the majorityClass as empty. // Could not be found.
majorityClass = [];

end