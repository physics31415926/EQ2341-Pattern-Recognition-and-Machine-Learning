% chose the music sound 
[x,f]=audioread('Sounds/music.wav');
[spec,f,t] = GetSpeechFeatures(x,f,0.03);
[cep,dctm] = spec2cep(spec);
log_spec = log10(spec);
R_spec = corr(log_spec);
R_cep = corr(cep);
% abs
R_spec = abs(R_spec);
R_cep = abs(R_cep);
colormap(gray);
subplot(1,2,1);
imagesc(R_spec);
title('spec\_comatrix');
subplot(1,2,2);
imagesc(R_cep);
title('ceps\_comatrix');


