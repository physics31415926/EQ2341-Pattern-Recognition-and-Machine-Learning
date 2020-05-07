q = [0.75 0.25];
%infinite duration
%A = [0.99 0.01;0.03 0.97];
%finite duration
A = [0.99 0.0099 0.0001;0.03 0.97 0];
%X is random variable
b1 = GaussD;
b2 = GaussD('Mean',1,'StDev',2);
B = [b1;b2];
%X is random vector
% b1 = GaussD('Mean',[0;0],'Covariance',[2,1;1,4]);
% b2 = GaussD('Mean',[0;0],'Covariance',[2,1;1,4]);
B = [b1;b2];
mc = MarkovChain(q,A);
hm = HMM(mc,B);
sample = rand(mc,100000);
mu_mc = mean(sample);
%calculate stable distribution
[V, D] = eig(A(1:2,1:2)');
p_cov = V*[1,0;0 0]*inv(V)*q';
sample2 = [];
pd = hm.OutputDistr(sample);
for i = 1:length(sample)
    sample2 = [sample2, rand(pd(i),1)];
end   
mu_hm = mean(sample2,2);
var_hm = var(sample2,0,2);
subplot(2,1,1);
plot(1:500,sample(1:500));
xlabel('t');
ylabel('St');
title('St-t');
axis([0 500 0.5 2.5]);
subplot(2,1,2);
plot(1:500,sample2(1:500));
xlabel('t');
ylabel('Xt');
title('Xt-t');
%Verify distribution
cov = [0,0;0,0];
for i = 1:2
    for j= 1:2
        cov(i,j) = (sample2(i,:)-mu_hm(i))*(sample2(j,:)-mu_hm(j))'/length(sample);
    end
end