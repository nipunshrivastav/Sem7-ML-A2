function [vocab, yVal, userid, mailCounter, counter] = readFile_big()

% %% Reading data
% 
% S = textread('test', '%s', 'delimiter', '\n', 'whitespace', '');
% puts all mail in a 1d array with first mail as the 1st cell of the array,
% 2nd mail as the 2nd array and so on
% 1st mail is S{1} and so on

fileName = 'train';
inputfile = fopen(fileName);


vocab = java.util.Hashtable; 
counter = 0;

mailCounter = 0;

while 1

    % Get a line from the input file
    tline = fgetl(inputfile);

    % Quit if end of file
    if ~ischar(tline)
        break
    end
    
    mailCounter = mailCounter + 1;

    [userid{mailCounter}, remain] = strtok(tline);
    [a, remain] = strtok(remain);
    if (strcmpi(a,'spam'))
        yVal(mailCounter) = 1;
    else
        yVal(mailCounter) = -1;
    end


    C = textscan(tline,'%s');
    % splits line into words and stores words in 1D array C
        
    for i = 3:2:length(C{1})
        key = vocab.get(C{1}{i});
        
        if(isempty(key))
             counter = counter+1;
             vocab.put(C{1}{i},counter); 
%         else
%             key
        end
    end

end

fclose(inputfile); 

end