function [yVal,xVal] = prepareTest(vocab,vocabSize)

fileName = 'test';
inputfile = fopen(fileName);



loopCounter = 0;

while 1

    % Get a line from the input file
    tline = fgetl(inputfile);

    % Quit if end of file
    if ~ischar(tline)
        break
    end
    
    loopCounter = loopCounter + 1;

    [userid, remain] = strtok(tline);
    [a, remain] = strtok(remain);
    if (strcmpi(a,'spam'))
        yVal(loopCounter) = 1;
    else
        yVal(loopCounter) = -1;
    end


    C = textscan(tline,'%s');
    % splits line into words and stores words in 1D array C
    
    x = zeros(vocabSize,1);
    
    for i = 3:2:length(C{1})
        key = vocab.get(C{1}{i});
        
        if(isempty(key))
            continue
        else
            
            key = int16(key);
            a = int16(str2double(C{1}{i+1}));
            x(key) = a;
        end
    end
    
    xVal(loopCounter,:) = x;

end

fclose(inputfile); 

end