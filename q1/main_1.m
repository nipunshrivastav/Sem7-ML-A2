clear all;clc;

[vocab, y, userid, mailCount, vocabSize] = readFile();

x = process(vocab, mailCount, vocabSize);
x = double(x);
y = double(y');

aMatrix = cvxPart(x,y,mailCount);

[w, b] = findwb(aMatrix,y,x, mailCount);

accuracy = test(w,b, vocab, vocabSize);

gMatrix = cvxPartGauss(x,y,mailCount, 0.00025);

bGauss = findb(gMatrix,y,x, mailCount,  0.00025);

accuracyGauss = testGauss(gMatrix,x,y,mailCount,bGauss, vocab, vocabSize, 0.00025);



[vocab_big, y_big, userid_big, mailCount_big, vocabSize_big] = readFile_big();

x_big = process_big(vocab_big, mailCount_big, vocabSize_big);
x_big = double(x_big);
y_big = double(y_big');


[x_test, y_test] = processTest(vocab, mailCount, vocabSize);
x_test = double(x_test);
y_test = double(y_test');


[x_test_big, y_test_big] = processTest(vocab_big, mailCount_big, vocabSize_big);
x_test_big = double(x_test_big);
y_test_big = double(y_test_big');


[modelGauss, modelLinear, modelGauss_big, modelLinear_big] = svmPart(x,y,x_big,y_big,x_test,y_test,x_test_big,y_test_big);
