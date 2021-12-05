function x= Newton_iteration(func,df,tol,x0)
a=func(x0);
b=1;
count=0;
x=0;
while(abs(a-b)>=tol)
    a=func(x0);
    f2=df(x0);
    if(f2==0)
        disp('error');
        break
    else
        x0=x0-a/f2;
    end
    b=func(x0);
    count=count+1;
end
%%disp(count);
x=x0;

end