function [s1,s2] = split(set,index,threshold) 

s1 = []; %Instaniate set 1
s2 = []; %Instaniate set 2
nr = size(set);
%For loop that runs the amount of times equal to the length of set
    for i = 1:nr(1,1)
        % Evaluate row i, column index in the data set whether its lower than the threshold
        if(set{i,index} < threshold)
            % Duplicates the entire row of i in the data set and appends it
            % to the end of s1
            s1 = [s1; set(i,:)];
        else
            % Duplicates the entire row of i in the data set and appends it
            % to the end of s2
            s2 = [s2; set(i,:)];
        end
    end
end