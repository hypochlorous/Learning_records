function[t,err,h]=rom(f,a,b,tol1)
m=1;
h=b-a;
err=1;
t=zeros(8,4);%%
t(1,1)=h*(f(a)+f(b))/2;
for k=2:4
    h=h/2;
    sum=0;
    for i=1:m
       x=a+h*(2*i-1);
       sum=sum+f(x);
    end
    t(k,1)=t(k-1,1)/2+h*sum;
    m=m*2;%m=2^(k-1)
    for i=2:k
        t(k,i)=(4^(i-1)*t(k,i-1)-t(k-1,i-1))/(4^(i-1)-1);
    end
end
k=k+1;
while(err>tol1)
    sum=0;
    h=h/2;
    for i=1:m
       x=a+h*(2*i-1);
       sum=sum+f(x);
    end
    t(k,1)=t(k-1,1)/2+h*sum;
    for i=2:4
        t(k,i)=(4^(i-1)*t(k,i-1)-t(k-1,i-1))/(4^(i-1)-1);
    end
    m=m*2;%m=2^(k-1)
    k=k+1;
    err=abs(t(k-1,4)-t(k-2,4));
end
disp(t(k-1,4));
end
