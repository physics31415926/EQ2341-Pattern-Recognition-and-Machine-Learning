function S=rand(mc,T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors:
%---------------------------------------------

nS=mc.nStates;
pd = DiscreteD(mc.InitialProb);
state = rand(pd,1);
S = state;

if finiteDuration(mc)
    for t = 2:T
        pd = DiscreteD(mc.TransitionProb(state,:));
        state = rand(pd,1);
        if state > nS
            break;
        end
        S = [S state];
    end
else
    for t = 2:T
        pd = DiscreteD(mc.TransitionProb(state,:));
        state = rand(pd,1);
        S = [S state];
    end    
end
end


