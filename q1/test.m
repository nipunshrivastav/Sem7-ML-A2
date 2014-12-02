function accuracy = test(w,b,vocab,vocabSize)

fileName = 'test';
inputfile = fopen(fileName);



correct = 0;

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
        yVal = 1;
    else
        yVal = -1;
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
    
    res = w*x;
    res = res+b;
    
    if (res>0)
        res = 1;
    else
        res = -1;
    end
    
    if (yVal == res)
        correct = correct+1;
    end

end
accuracy = (correct/loopCounter) * 100;
fclose(inputfile); 

end