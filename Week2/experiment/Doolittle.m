function X=Doolittle(A,b)
[n,~]=size(A);
L=eye(n,n);
U=zeros(n,n);
for k=2:n
    for j=1:n
        U(1,j)=A(1,j);
    end
    for i=2:n
        L(i,1)=A(i,1)/U(1,1);
    end
    
    for j=k:n
        sum=0;
        for m=1:k-1
            sum=sum+L(k,m)*U(m,j);
        end
        U(k,j)=A(k,j)-sum;
    end
    
    for i=k+1:n
        sum=0;
        for m=1:k-1
            sum=sum+L(i,m)*U(m,k);
        end
        L(i,k)=(A(i,k)-sum)/U(k,k);
    end
end


y(1)=b(1);
for k=2:n
    sum=0;
    for j=1:k-1
        sum=sum+L(k,j)*y(j);
    end
    y(k)=b(k)-sum;
end

X(n)=y(n)/U(n,n);
for k=n-1:-1:1
    sum=0;
    for j=k+1:n
    sum=sum+U(k,j)*X(j);
    end
    X(k)=(y(k)-sum)/U(k,k);
end
disp(X);
end
