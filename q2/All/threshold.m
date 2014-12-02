function res = threshold(arr)

res = arr - arr;

for i = 1:length(arr)
    if (arr(i)>0.5)
        res(i) = 1;
    end
end