[x1,f1] = audioread('Sounds/female.wav');
[x2,f2] = audioread('Sounds/music.wav');
[x3,f3] = audioread('Sounds/male.wav');

% % female spectra and cepstra
% subplot(1,2,1)
% [spec1,f1,t1] = GetSpeechFeatures(x1,f1,0.03);
% imagesc(t1,f1,10*log10(spec1));
% h = colorbar;
% ylabel(h, 'Power density/dB');
% axis xy;
% xlabel('Time/s');
% ylabel('Frequency/Hz');
% title('spectra');
% subplot(1,2,2)
% [cep1,dctm1] = spec2cep(spec1);
% imagesc(cep1');
% axis xy;
% xlabel('order of coefficients');
% ylabel('pseudo frequency');
% title('cepstra');

% % music spectra and cepstra
% subplot(1,2,1)
% [spec2,f2,t2] = GetSpeechFeatures(x2,f2,0.03);
% imagesc(t2,f2,10*log10(spec2));
% h = colorbar;
% ylabel(h, 'Power density/dB');
% axis xy;
% xlabel('Time/s');
% ylabel('Frequency/Hz');
% title('spectra');
% subplot(1,2,2)
% [cep2,dctm2] = spec2cep(spec2);
% imagesc(cep2');
% axis xy;
% xlabel('order of coefficients');
% ylabel('pseudo frequency');
% title('cepstra');

% male and female spectra
% subplot(1,2,1)
% [spec1,f1,t1] = GetSpeechFeatures(x1,f1,0.03);
% imagesc(t1,f1,10*log10(spec1));
% h = colorbar;
% ylabel(h, 'Power density/dB');
% axis xy;
% xlabel('Time/s');
% ylabel('Frequency/Hz');
% title('female');
% subplot(1,2,2)
% [spec3,f3,t3] = GetSpeechFeatures(x3,f3,0.03);
% imagesc(t3,f3,10*log10(spec3));
% h = colorbar;
% ylabel(h, 'Power density/dB');
% axis xy;
% xlabel('Time/s');
% ylabel('Frequency/Hz');
% title('male');

% male and female cepstra
subplot(1,2,1)
[cep1,dctm1] = spec2cep(spec1);
imagesc(cep1');
axis xy;
xlabel('order of coefficients');
ylabel('pseudo frequency');
title('female');
subplot(1,2,2)
[cep3,dctm3] = spec2cep(spec3);
imagesc(cep3');
axis xy;
xlabel('order of coefficients');
ylabel('pseudo frequency');
title('male');
