# Chap2

## 2.1 Insert_sort

插入排序主要对与少量元素的排序.每次取出从剩下元素中一个,依次比较(属于比较排序

## code

``` c
insert_sort(A)
for j=2:A.length
key=A[j];
i=j-1;
while(i>0&&A[i]>key)
{a[i+1]=a[i];i=i-1;}
a[i+1]=key;
```

循环不变式:循环体中所有**循环变量**的变化规律并在循环体执行前后都为真称为循环不变式**是一个命题**类似数学归纳

判断:初始为真(迭代前) 保持:第i次循环满足命题性质 终止:终止时命题提供一个性质,证明算法是正确的

**Master theorem**  T(N)=aT(N/b)+O(N^d)  
$$
\begin{cases}
T(n)=O(N^d)& (\log_ba<d) \\
T(n)=O(N^log_ba) & (\log_ba>d) \\
T(n)=O(N^d *logN)& (\log_ba=d)
\end{cases}
$$

# Chap3  函数增长

所有和g(n)同阶的函数集
OH(g(n)):n充分大时,c1g(n)<=f(n)<=c2g(n)(同时给出上下界)  
O(g(n)):n充分大时,f(n)<=cg(n)(只给出上界)  
Ω(g(n)):n充分大时,f(n)>=cg(n)(只给出下界)  
a^lgc_b = c^lga_b
其余数学知识均为常识


# Chap 10
## 10.1 Stack&Queue

栈上的Insert操作-Push,Delete操作-POP 没有元素参数

栈空 S.top=0//index==0

栈的数组实现操作(时间均为O(1))  
``` c
Push(S,x)  
S.top=S.top+1;  
S[S.top]=x;

Pop(S)
if(!empty(s))  
S.top-=1;  
return S[S.top+1];

Q.head==Q.tail;//队空条件

Enqueue(Q,x)(时间均为O(1))  
Q[Q.tail]=x;  
if(Q.tail==Q.length)  
    Q.tail=1;  
else Q.tail=Q.tail+1;  

Dequeue(Q,x)  
x=Q[Q.head];  
if (Q.head==Q.length)
    Q.head=1;  
else Q.head=Q.head+1;  
return x;  
```
ex:重写入队出队解决上下溢出,双端队列,两个队列一个栈/一个队列两个栈

## 10.2 Linklist
``` c
list_search(L,k)//O(n)  
x=L.head;  
while x!=NULL&& x.key!=k  
    x=x.next;  
return x;

List_insert(L,x)//O(1)  
if L.head!=NULL  
    L.head.prev=x;  
L.head=x;  
x.prev=NULL;

List_Delete(L,x)//本身O(1),worst:O(n)先调用Search  
if (x.prev!=NULL) x.prev.next=x.next;  
else L.head=x.next;  
if x.next!=NULL
    x.next.prev=x.prev;

Circular,doubly linked list with sentinel(降低常数因子)

Search'(L,k)  
x=L.nil.next  
while (x !=L.nil&&x.key !=k) x=x.next;  
return x;

Insert'(L,x)  
x.next=L.nil.next;  
L.nil.next.prev=x;  
L.nil.next=x;  
x.prev=L.nil;
```
ex:用单链表实现Stack,Queue

## 10.4有根树的链式表示

二叉树表示:x.p,x.left,x.right  
左孩子右兄弟表示法