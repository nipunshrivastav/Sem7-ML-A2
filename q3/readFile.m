

function [totalCounter, data] = readFile

fileName = '20ng-rec_talk.txt';
inputfile = fopen(fileName);

vocab = java.util.Hashtable;
news = java.util.Hashtable;

counter = 0;
totalCounter = 0;
newsCount = 0;
wordsPerClass = zeros(8,1);


while (1)

    % Get a line from the input file
    tline = fgetl(inputfile);

    % Quit if end of file
    if ~ischar(tline)
        break
    end
    
    
    totalCounter = totalCounter + 1;
    data{totalCounter} = textscan(tline,'%s');

%     [newsClass, remain] = strtok(tline);
%     
%     key = news.get(newsClass);
% 
%     if(isempty(key))
%         newsCount = newsCount+1;
%         news.put(newsClass,newsCount);
%         newsIndex = newsCount;
%         classCount(newsIndex) = 1;
%     else
%         newsIndex = key;
%         classCount(newsIndex) = classCount(newsIndex) + 1;
%     end    
% 
% 
%     C = textscan(remain,'%s');
%     % splits line into words and stores words in 1D array C
%         
%     for i = 1:length(C{1})
%         key = vocab.get(C{1}{i});
%         
%         if(isempty(key))
%              counter = counter+1;
%              vocab.put(C{1}{i},counter);
%              wordsPerClass(newsIndex,counter) = 1;
%              
%         else
%             wordsPerClass(newsIndex,key)=wordsPerClass(newsIndex,key)+1;
%         end
%     end
%     
end

fclose(inputfile); 
% 
% for i = 1:length(wordsPerClass)
%     totalWords(i) = sum(wordsPerClass(:,i));
% end
% 
% for i = 1:newsCount
%     totalWordsPerClass(i) = sum(wordsPerClass(i,:));
% end
% 
% 
% end

