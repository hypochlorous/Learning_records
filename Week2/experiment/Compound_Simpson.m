function Compound_Simpson(n,a,b,func)%%[node,left,right,Function]
h=(b-a)/(n-1);
t=a:h:b;
A=func(a);
B=func(b);
sum=0;

for k=1:(n-1)/2%%  1-6
  sum=sum+4*func(t(2*k));
end
for k=1:(n-1)/2 -1%%  1-5
  sum=sum+2*func(t(2*k+1));
end
sum=(sum+A+B)*h/3;
disp(sum);
end
%% 1 2 3 4 5 6 7 8 9 10 11 12 13
%%  1   3   5   7   9   11