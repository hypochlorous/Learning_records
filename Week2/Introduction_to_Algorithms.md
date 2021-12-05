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

# Chap11
Hash Function设计原则:简单(快速计算，映射简单),均匀(避免聚集减少冲突
Hash(key)=address;

直接寻址表(direct-address table)对search,insert,delete操作都只需要O(1)

处理冲突的方法:链地址,开放地址

## 11.2链地址法(Chaining)
H=key%p；将同义词存储到单链表  
指向存储所有到H元素的链表的表头,若不存在,则为NIL.

## 11.3散列函数


1.线性映射 h(x)=ax+b 
适用于事先知道key 集合不大且连续性好(不连续会浪费空间  
2.留余数 h(x)=x%p;p为不大于表长的最大素数(因子越多冲突越多)  
3.随机数 h(x)=rand(x)%p;  
4.乘法散列法 h(x)= [m(x*A mod1)] //乘以(0,1)上的常数,取小数部分乘以m再取整  
对任何值都适用,A≈(sqrt(5)-1)/2是比较好的值.

## 11.4开放地址(Open addressing)  
(1.线性探测hash‘=(hash+di)%m  di=123456.  
遇到占用的向后找空的位置，非同义也会占用，降低查找效率  
(2.二次探测 di=1,-1,..k^2,-k^2//二次探测是跳跃式探测 效率高?但会出现有空间  
但探测不到的情况 存储失败 线性有空间就行

```c
int Linedetect(int HT[],int H0,int key,int &cnt)
{
    int Hi;
    for(int i=1;i<m;++i)
    {
        cnt++;
        Hi=(H0+i)%m; //按照线性探测法计算下一个哈希地址Hi
        if(HT[Hi]==NULLKEY)
            return Hi;	//若单元Hi为空，则所查元素不存在
        else if(HT[Hi]==key)
            return Hi; //若单元Hi中元素的关键字为key
    }
    return -1;
}


int Seconddetect(int HT[],int H0,int key,int &cnt)
{
    int Hi;
    for(int i=1;i<=m/2;++i)
    {
        int i1=i*i;
        int i2=-i1;
        cnt++;
        Hi=(H0+i1)%m; //按照线性探测法计算下一个哈希地址Hi
        if(HT[Hi]==NULLKEY)//若单元Hi为空，则所查元素不存在
            return Hi;
        else if(HT[Hi]==key)//若单元Hi中元素的关键字为key
            return Hi;
        cnt++;
        Hi=(H0+i2)%m; //按照线性探测法计算下一个哈希地址Hi
        if(Hi<0)
            Hi+=m;
        if(HT[Hi]==NULLKEY)//若单元Hi为空，则所查元素不存在
            return Hi;
        else if(HT[Hi]==key)//若单元Hi中元素的关键字为key
            return Hi;
    }
    return -1;
}
```