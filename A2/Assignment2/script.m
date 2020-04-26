[x1,f1] = audioread('Sounds/female.wav');
[x2,f2] = audioread('Sounds/music.wav');
% sound(x1,f1);

%plot((1:length(x1))/f1,x1);
%plot((1:length(x2))/f2,x2);

% s = spectrogram(x);
% spectrogram(x,'yaxis');

%female spectrogram
% [spec1,f1,t1] = GetSpeechFeatures(x1,f1,0.03);
% imagesc(t1,f1,10*log10(spec1));
% h = colorbar;
% ylabel(h, 'Power density/dB');
% axis xy;
% xlabel('Time/s');
% ylabel('Frequency/Hz');

%music spectrogram
[spec2,f2,t2] = GetSpeechFeatures(x2,f2,0.03);
imagesc(t2,f2,10*log10(spec2));
h = colorbar;
ylabel(h, 'Power density/dB');
axis xy;
xlabel('Time/s');
ylabel('Frequency/Hz');