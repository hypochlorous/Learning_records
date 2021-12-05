# ex1
func1=@(x) sin(x);
func2=@(x) log(x);
func3=@(x) x^2;
algo1(@(x)sin(x),1,0.1)-cos(1)
algo2(@(x)sin(x),1,0.1)-cos(1)

# ex2 
x=	[1.2	1.3	1.4	1.5	1.6	1.7];
y=	[1.244	1.406	1.602	1.837	2.121	2.465];

x=[1.4 1.5 1.6];
y=[1.602 1.837 2.121];
lagran(x,y)
Newton(x,y)
func =@(x) (1+25*x.^2).^(-1)


# ex3

x=	[0.1	0.3	0.5	0.6	0.7	0.9];
y=	[0.61	0.92	1.12	1.52	1.47	2.04];
Fitting(x,y);

# ex4
func=@(x) x./log(x+1);
Compound_trapezoid(13,1,2,func);
Compound_Simpson(13,1,2,func);
successive_interval(1,2,func,5e-6);
func_2=@(x) 4/(1+x*x);
rom(func_2,0,1,5e-6);

# ex5
A1=[3 2 -1 2; 1 4 0 2; 2 1 2 -1;1 1 -1 3];
b1=[-2;1;3;4];
C_pivot(A1,b1);
Doolittle(A1,b1);
A2=[1 2 3 4 5;-2 3 4 5 6;-3 -4 5 6 7;-4 -5 -6 7 8;-5 -6 -7 -8 9];
b2=[55;66;63;36;-25];
Jacobi_iteration(A2,b2,[1;2;3;4;5]);
GS(A2,b2,[1;2;3;4;5])
	
# ex6
func_1=@(x)2^(-x)-x;
func_2=@(x)1+sin(x)-2*cos(x);
func_3=@(x)2*sin(x+pi/3)-x;
df=@(x) 2*cos(x+pi/3)-1;
delta=1e-8;
Division(func_1,delta,0,1)
xiange(func_2,0,pi/4,delta)
Newton_iteration(func_3,df,delta,1e-8)
func_4_1=@(x) (1+x^2)^(1/3);
func_4_2=@(x) (1+x^(-2));
func_4_3=@(x) (x-1)^(-1/2);
func_4_4=@(x) (x^3-1)^(1/2);
iteration(func_4_1,1.5,1e-8)

# ex7
f1=@(x,y) -y+2*(x+1);
Euler(f1,0,1,0.1);
f2=@(x,y) x+y;
Improved_Euler(f2,0,1,0.1);
f3=@(x,y) x^2+y*x^3;
RK4(f3,1,2,0.2);

