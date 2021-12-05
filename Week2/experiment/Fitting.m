function Fitting(X,Y)

for i=1:6
A(i,:)=[1 X(i) exp(X(i)) sin(X(i)) ];

end

c=inv(A'*A)*A'*Y';
xx=0:0.01:1;
yy=c(1)+c(2)*xx+c(3)*exp(xx)+c(4)*sin(xx);%%phix


x=linspace(0,1,101);
p5=polyfit(X,Y,5);
y5=polyval(p5,x);

p3=polyfit(X,Y,3);
y3=polyval(p3,x);

lagran(X,Y);
hold on;
plot(xx,yy,x,y5,x,y3,X,Y,'o');
legend('lagrange','phi','n=5','n=3','O');
axis([0 1 0 3]);
hold off;

Y5=polyval(p5,X);
Y3=polyval(p3,X);
YY=c(1)+c(2)*X+c(3)*exp(X)+c(4)*sin(X);
LF=matlabFunction(lagran(X,Y));
YL=LF(X);
disp(norm(Y5-Y));
disp(norm(Y3-Y));
disp(norm(YY-Y));
disp(norm(YL-Y));
end