function Division(fun,x,a,b)
count=0;
while (fun(a)*fun(b) <=0) && (abs(a-b)>x)
    c=(a+b)/2;
    if fun(c)*fun(b)<=0
        a=c;
        count=count+1;
    else
        count=count+1;
        b=c;
    end
end
disp((a+b)/2);
end
