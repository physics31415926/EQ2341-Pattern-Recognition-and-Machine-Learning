init;
b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);
h = HMM(mc, [b1, b2]);

[X,S]=rand(h,T);

mu = mean(X, 2)
va = var(X, 0, 2)
