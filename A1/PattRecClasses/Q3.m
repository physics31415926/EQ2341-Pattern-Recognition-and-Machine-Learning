init;
b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);
h = HMM(mc, [b1, b2]);

n=10;
mu=zeros(1,n);
va=zeros(1,n);
for i = 1:n
    [X,S]=rand(h,T);
    mu(i) = mean(X);
    va(i) = var(X);
end

MU=mean(mu)
VA=mean(va)

