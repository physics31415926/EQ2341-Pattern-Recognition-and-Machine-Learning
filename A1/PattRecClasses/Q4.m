init;
b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);
h = HMM(mc, [b1, b2]);

nSamples = 500;
[X, S] = rand(h, nSamples);

figure;
subplot(2, 1, 1);
plot(1:length(S), S);
title('St-t')
ylim([0,3])
xlabel('t'); ylabel('St');
subplot(2, 1, 2);
plot(1:length(X), X);
title('Xt-t')
xlabel('t'); ylabel('Xt');