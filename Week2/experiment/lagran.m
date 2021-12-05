function result=lagran(X,Y)
n=length(X);
syms x;
result=0;
for i=1:n
    tem=1;
    for(j=1:n)
        if (i~=j)
            tem=tem*(x-X(j))/(X(i)-X(j));%%插值基函数
        end
    end
    result=tem*Y(i)+result;%%插值多项式
end

fplot(result);
%axis([1,2,1,3]);%%限制图像显示范围
%x=1.54;
%disp(subs(result));%%对x赋值求近似值
hold on;

end