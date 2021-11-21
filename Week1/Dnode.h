#ifndef _Dnode_h
#define _Dnode_h

typedef int ElemType;
typedef struct DNode{
	ElemType data;
	struct DNode *prior,*next;
}DNode,*DLinkList;

DLinklist Dlist_Hinsert(DLinkList L);
DLinklist Dlist_Tinsert(DLinkList L);
Dnode *GetElem(DLinkList L,int x);
bool DListInsert(DLinkList L,int x,ElemType e);
bool DListDelete(DLinkList L,int x);
void PrintDList(DLinkList L);

#endif