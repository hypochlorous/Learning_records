function xiange(f,a,b,d)
    while(abs(a-b)>d)
    y=b-f(b)/(f(b)-f(a))*(b-a);
    a=b;
    b=y;
    end
    disp(b);
end