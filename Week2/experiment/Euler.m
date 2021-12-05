function Euler(f,a,b,h)
X=a:h:b;
Y(1)=1;
for i=1:(b-a)/h
    Y(i+1)=Y(i)+h*f(X(i),Y(i));
end
plot(X,Y);
hold on;

syms y(x);
equ=dsolve(diff(y,x)+y-2*(x+1)==0,'y(0)=1');
fplot(equ);
axis([0 1 1 2.5]);
legend('Euler法求解','dsolve函数求解');


Equ=matlabFunction(equ);
YY=Equ(X);
disp(norm(YY-Y));
end

