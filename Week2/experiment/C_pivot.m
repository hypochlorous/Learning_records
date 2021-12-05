function X = C_pivot( A, b )
[n, ~] = size(A);
X = zeros(n,1);
l=zeros(n,n);
p=0;k=0;
%消去
for k=1:n-1%%列主元pivot
    p=k;
    for i=k+1:n
        if(abs(A(i,k))<abs(A(p,k))&&A(i,k)~=0)
            p=i;
        end
    end
    if p~=k
        tem=A(k,:);
        A(k,:)=A(p,:);
        A(p,:)=tem;
        tem=b(k);
        b(k)=b(p);
        b(p)=tem;
    end
    for i=k+1:n
        l(i,k)=A(i,k)/A(k,k);
        b(i)=b(i)-l(i,k)*b(k);
        for j=k+1:n
            A(i,j)=A(i,j)-l(i,k)*A(k,j);
        end
    end
end
X(n)=b(n)/A(n,n);
for k=n-1:-1:1
    sum=0;
    for i=k+1:n
        sum=sum+A(k,i)*X(i);
    end
    X(k)=(b(k)-sum)/A(k,k);
end
disp(X);
end


