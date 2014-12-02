

clear all;clc;

[totalCounter, data] = readFile();
% counter is unique words or vocab size



% probWordsPerClass = zeros(newsCount,counter);
% 
% for i = 1:newsCount
%     probWordsPerClass(i,:) = (wordsPerClass(i,:)+1)/(totalWordsPerClass(i)+counter);
% end
% 
% probClass = classCount/totalCounter;

Randomize = randperm(totalCounter);

eachSize = totalCounter/5;
a = zeros(5,eachSize);

for i = 0:4
    a(i+1,:) = Randomize((eachSize)*i+1:(eachSize)*(i+1));    
end

confusionMatrix = zeros(uniqueClass,uniqueClass);

for i = 1:5
    for j = 250:250:1500
        [probClass,probWordsPerClass,vocab,news,uniqueWords, uniqueClass] = findProb(data,a,i,j);
        [accuracy(i,j/250),confusionMatrix] = check(probClass,probWordsPerClass,vocab,news,i,a,data,uniqueClass,confusionMatrix,j);
    end
   
end


%% Plotting
avrg_accuracy = mean(accuracy);
x = 250:250:1500
x(end) = length(a);
figure
hold on;
plot(4*x,avrg_accuracy);
scatter(4*x,avrg_accuracy);
hold off;
title('Accuracy v/s Training Examples');
xlabel('Number of Training Examples');
ylabel('Accuracy');


%% Confusion Matrix

sumConfusion = sum(confusionMatrix);

for k = 1:uniqueClass
confusionMatrix(:,k) = confusionMatrix(:,k)/sumConfusion(k);
end

