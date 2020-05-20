addpath 'C:\Users\wsccs\Downloads\PRML\PattRecClasses\GetSpeechFeatures';
addpath 'C:\Users\wsccs\Downloads\PRML\PattRecClasses';
cd Actor_01;
fileName = ls;
feature = [];
featureLength = [];
[x, fs] = audioread(fileName(3,:));
[mfccs1,spec1,f1,t1]=GetSpeechFeatures(x(:,1),fs,0.03,13);
test = feature_normalized(mfccs1);

for i = 4:62
    [x, fs] = audioread(fileName(i,:));
    [mfccs1,spec1,f1,t1]=GetSpeechFeatures(x(:,1),fs,0.03,13);
    check = isfinite(mfccs1);
    if all(all(check))
        mfccs_n1 = feature_normalized(mfccs1);
        feature = [feature mfccs_n1];
        featureLength = [featureLength size(mfccs_n1,2)];
    end
end

cd ..;
nStates = 50;
pD = [];
for i = 1:nStates
    pD = [pD GaussD('Mean',1*rand(39,1),'Covariance',eye(39))];
end

hmm=MakeErgodicHMM(nStates,10,pD,feature,featureLength);
hmm=train(hmm,feature,featureLength,20,log(1.01));
lP=logprob(hmm,test);
[S,logP]=viterbi(hmm,test);