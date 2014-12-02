function [probClass,probWordsPerClass,vocabb,newsb,uniqueWords,uniqueClass] = findProb(data,a,i,size_train)

counter = 0;
totalCounter = 0;
newsCount = 0;
wordsPerClass = zeros(8,1);

if (size_train>length(a))
    size_train = length(a);
end

vocabb = java.util.Hashtable;
newsb = java.util.Hashtable;

uniqueWords = 0;
uniqueClass = 0;
loopCount = 0;
wordsPerClass = zeros(8,1);

for j = 1:5
        
    
    if (j==i)
        continue;
    else
        for k = 1:size_train
            loopCount = loopCount+1;
          
            x = data{a(j,k)}{1};
            
            key = newsb.get(x{1});
            
            
            if(isempty(key))
                
                uniqueClass = uniqueClass+1;
                newsb.put(x{1},uniqueClass);
                classCount(uniqueClass) = 1;
                key = uniqueClass;
            else
                classCount(key) = classCount(key) + 1;
            end
            
            for l = 2:length(x)
                
                key2 = vocabb.get(x{l});
                
                if(isempty(key2))
                    uniqueWords = uniqueWords+1;
                    vocabb.put(x{l},uniqueWords);
                    wordsPerClass(key,uniqueWords) = 1;
                else
                    wordsPerClass(key,key2) = wordsPerClass(key,key2)+1;
                end
                
            end
        end
            
    end
end




for i = 1:uniqueClass
    totalWordsPerClass(i) = sum(wordsPerClass(i,:));
end

probWordsPerClass = zeros(uniqueClass,uniqueWords);

for i = 1:uniqueClass
    probWordsPerClass(i,:) = (wordsPerClass(i,:)+1)/(totalWordsPerClass(i)+uniqueWords);
end

probClass = classCount/loopCount;