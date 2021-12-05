function result = Newton (X,Y)
n=length(X);
D=zeros(n,n);
syms x;
result=Y(1);
D(:,1)=Y';
    for j=2:n
        for(k=j:n)
            D(k,j)=(D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
        end
    end
    for i=2:n
        tem=1;
        for j=2:i
            tem=tem*(x-X(j-1));
        end
        result=result+tem*D(i,i);
    end
    fplot(x,result);
    axis([1,2,1,3]);%%限制图像显示范围
%     x=1.54;
%     disp(subs(result));
end
        