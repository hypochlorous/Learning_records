function GS(A,b,X0)
[n,~]=size(A);
L=tril(A,-1);
U=triu(A,1);
D=diag(diag(A));
count=0;
Bs=-(D+L)^(-1)*U;
X1 =zeros(n,1);
r=1;
while r>1e-5
    X1=-(D+L)^(-1)*U*X0+(D+L)^(-1)*b;
    r=abs(X1(1)-X0(1));
    for i=2:n
        if r<abs(X1(i)-X0(i))
            r=abs(X1(i)-X0(i));
        end
    end
    X0=X1;
    count=count+1;
end
disp(X1);
disp(max(abs(eig(Bs))));
end
