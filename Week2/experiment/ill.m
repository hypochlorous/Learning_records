function [A,b]=ill(n)
A=zeros(n,n);
for i=1:n-1
    A(i,i)=6;
    A(i,i+1)=1;
    A(i+1,i)=8;
    if i~=1
        b(i)=15;
    end
end
A(n,n)=6;
b(1)=7;
b(n)=14;

%disp(cond(A,2));
%%disp(cond(A,1));
end
    