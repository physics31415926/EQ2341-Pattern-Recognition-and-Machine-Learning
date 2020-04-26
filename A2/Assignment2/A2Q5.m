% chose the music sound 
[x,f]=audioread('Sounds/music.wav');
[mfccs] = GetSpeechFeatures(x,f,0.03,13);
% dif and normalize
mfccs = mfccs';
mfccs = normalize(mfccs);
size(mfccs)
delta = diff(mfccs);
delta = normalize(delta);
deltadelta = diff(delta);
deltadelta = normalize(deltadelta);

% check the size
size(delta)
size(deltadelta)
newcep = [cep;delta;deltadelta]';
size(newcep)
colormap(gray)
subplot(1,1,1)
imagesc(newcep);
ylabel('order of coefficients');
xlabel('mfccs;delta;deltadelta');
title('feature vector series');

