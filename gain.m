% Returns the gain for a given origin set and two split sets.
function gain = gain(originSet, s1, s2)

entropyOriginalSet = entropy(originSet); % Returns entropy of original set
entropyS1 = entropy(s1); % Returns entropy of left split set
entropyS2 = entropy(s2); % Returns entropy of right split set

% Calculates the improvement gain of the two returned split sets over the
% original starting set.
gain = (entropyOriginalSet - (entropyS1 + entropyS2));
end