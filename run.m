cIndex = 1;

s = [1 2 3 4 5 6; 7 8 9 10 11 12]

s1 = [3;4];

cluster = cell(2,1);



cluster{cIndex} = (s1);

for i=1:4
cluster{cIndex} = [cluster{cIndex} [s(1,i); s(2,i)]];


end
disp(cluster{1});