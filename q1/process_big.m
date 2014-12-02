function x = process_big(vocab, mailCount, vocabSize)

fileName = 'train';
inputfile = fopen(fileName);

x = zeros(mailCount, vocabSize);

mailCounter = 0;

while 1

    % Get a line from the input file
    tline = fgetl(inputfile);

    % Quit if end of file
    if ~ischar(tline)
        break
    end
    
    mailCounter = mailCounter + 1;
    
    C = textscan(tline,'%s');
    % splits line into words and stores words in 1D array C
        
    for i = 3:2:length(C{1})
        key = int16(vocab.get(C{1}{i}));
        a = int16(str2double(C{1}{i+1}));
        x(mailCounter,key) = a;
    end

end

fclose(inputfile); 
