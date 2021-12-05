function res=interpolation(n)
func =@(x) (1+25*x.^2).^(-1)
%%t=-1:2/(n-1):1
for i=1:n
    t(i)=cos(((2*i-1))*pi/(2*n));%%Chebyshev节点
end
ft=zeros(n,1);
for i=1:n
    ft(i)=func(t(i));
end
lagran(t,ft);
