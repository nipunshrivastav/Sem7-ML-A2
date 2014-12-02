function [accuracy,confusionMatrix] = check(probClass,probWordsPerClass,vocabA,newsA,i,a,data,uniqueClass, confusionMatrix, size_train)

loopCount = 0;
correct = 0;



for k = 1:length(a)
    x = data{a(i,k)}{1};
    
    totalProb = log(probClass);
    
    key = newsA.get(x{1});
    
    if (isempty(key))
        continue
    else
        loopCount = loopCount+1;
        for j = 2:length(x)
            
            
            key2 = vocabA.get(x{j});
            
            if (isempty(key2))
                continue;
            else
                totalProb = totalProb + log(probWordsPerClass(:,key2)');
            end
            
            [maxVal, maxIndex] = max(totalProb);
            
        end

if (size_train>length(a))
confusionMatrix(maxIndex,key) = confusionMatrix(maxIndex,key) +1; 
end

        if (maxIndex == key)
            correct = correct+1;
        end
    end
end


accuracy = correct/loopCount*100