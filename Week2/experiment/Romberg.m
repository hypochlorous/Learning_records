function Romberg(n,a,b,func,tol)
h=b-a;
k=2;
j=0;
err=1;
T(1,1)=(b-a)*(func(a)+func(b))/2;
while k<20
   sum=0;
   for i=1:2^(k-2)
       sum=sum+func(a+(2*i-1)*h/2^(k-1));
   end
   T(k)=T(k-1)/2+(b-a)/2^(k-1)*sum;
   k=k+1;
end
while j<15
    S(k)=(4*T(k+1)-T(k))/3;
    j=j+1;
end
end
   
%    C(k)=(4^2*S(k+1)-S(k))/15;
%    R(k)=(4^3*C(k+1)-C(k))/63;
   