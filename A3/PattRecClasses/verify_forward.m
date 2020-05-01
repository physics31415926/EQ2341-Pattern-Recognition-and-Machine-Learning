q=[1;0];
A=[0.9, 0.1, 0; 0 ,0.9, 0.1];
mc = MarkovChain(q, A);
b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);

X = [-0.2,2.6,1.3];
[pX,~] = prob([b1,b2],X)
[alphaHat,c]=forward(mc,pX)