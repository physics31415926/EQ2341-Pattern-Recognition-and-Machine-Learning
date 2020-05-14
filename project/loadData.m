addpath 'C:\Users\wsccs\Downloads\PRML\PattRecClasses\GetSpeechFeatures';
addpath 'C:\Users\wsccs\Downloads\PRML\PattRecClasses';
cd Actor_01;
fileName = ls;
feature = [];
featureLength = [];

for i = 3:40
    [x, fs] = audioread(fileName(1,:));
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
pD = GaussD;

hmm=MakeLeftRightHMM(nStates,pD,feature,featureLength);
lP=logprob(hmm,feature(:,1:217));
hmm=train(hmm,feature,featureLength,20,log(1.01));
lP1=logprob(hmm,feature(:,1:217));
[S,logP]=viterbi(hmm,feature(:,1:217));