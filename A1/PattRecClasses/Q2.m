init;
S = rand(mc, T);
count = 0;
for i = 1 : T
    if S(i) == 1
        count=count+1;
    end
end
s1_percentage = count/T
s2_percentage = 1-s1_percentage
