function X1 = Jacobi_iteration( A, b ,X0)
[n, ~] = size(A);
L=tril(A,-1);
U=triu(A,1);
D=diag(diag(A));
Bj=-D^(-1)*(L+U);
X1 =zeros(n,1);
count=0;
tol=5e-12;
r=1;
while r>tol 
    X1=Bj*X0+D^(-1)*b;
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
% disp(cond(Bj,2));
% disp(max(abs(eig(Bj))));
end
