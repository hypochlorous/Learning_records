function sum=Compound_trapezoid(n,a,b,func)%%[node,left,right,Function]
h=(b-a)/(n-1);
t=a:(b-a)/(n-1):b;
A=func(a);
B=func(b);
sum=0;

for i=2:n-1
  sum=sum+2*func(t(i));
end
sum=(sum+A+B)*h/2;
disp(sum);
end