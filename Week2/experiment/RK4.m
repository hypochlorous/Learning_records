function RK4(f,a,b,h)
N=(b-a)/h;
X=a:h:b;
Y(1)=1;
for i=1:N
    k1=f(X(i),Y(i));
    k2=f(X(i)+h/2,Y(i)+k1*h/2);
    k3=f(X(i)+h/2,Y(i)+k2*h/2);
    k4=f(X(i)+h,Y(i)+k3*h);
    Y(i+1)=Y(i)+(k1+2*k2+2*k3+k4)*h/6;
end
plot(X,Y);
hold on;

syms y(x);
equ=dsolve(diff(y,x)-x^2-(x^3)*y==0,'y(1)=1');
fplot(equ);
axis([0.8 2.1 0 80]);
legend('四阶RK法求解','dsolve函数求解');

Equ=matlabFunction(equ);
YY=Equ(X);
disp(norm(YY-Y));

end