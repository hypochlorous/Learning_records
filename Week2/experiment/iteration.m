function iteration(func,x0,tol)
count=0;
r=1;
while r>tol
   x1=func(x0);
   r=abs(x1-x0);
   x0=x1;
   count=count+1;
   if count>10000
       break
   end 
end
disp(count);
disp(x1);
end
