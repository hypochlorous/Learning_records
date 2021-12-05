function T=Successive_interval(a,b,func,tol)
h=b-a;
k=2;
m=1;
err=1;
T(1)=(b-a)*(func(a)+func(b))/2;
while err>tol
    h=h/2;
    sum=0;
    for i=1:m
       x=a+h*(2*i-1);
       sum=sum+func(x);
    end
    T(k)=T(k-1)/2+h*sum;
    m=m*2;%m=2^(k-1)
    err=abs(T(k)-T(k-1));
    k=k+1;
end
disp(T(k-1));
end
    
