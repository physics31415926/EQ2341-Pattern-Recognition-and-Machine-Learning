init;
n=10;
s1_percentage=zeros(1,n);
s2_percentage=zeros(1,n);
for it=1:n
    S = rand(mc, T);
    count = 0;
    for i = 1 : T
        if S(i) == 1
            count=count+1;
        end
    end
    s1_percentage(it) = count/T;
    s2_percentage(it) = 1-s1_percentage(it);
end

S1=mean(s1_percentage)
S2=mean(s2_percentage)

