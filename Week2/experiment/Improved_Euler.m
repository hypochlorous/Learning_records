function Improved_Euler(f,a,b,h)
X=a:h:b;
Y(1)=1;
for i=1:(b-a)/h
    Y(i+1)=Y(i)+h*f(X(i),Y(i));
    Y(i+1)=Y(i)+h*(f(X(i),Y(i))+f(X(i+1),Y(i+1)))/2;
end
plot(X,Y);
hold on;

syms y(x);
equ=dsolve(diff(y,x)-x-y==0,'y(0)=1');
fplot(equ);
axis([0 1 1 3.5]);
legend('改进的Euler法求解','dsolve函数求解');

Equ=matlabFunction(equ);
YY=Equ(X);
disp(norm(YY-Y));
end