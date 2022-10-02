#include<stdio.h> /* EOF(=^Z或F6),NULL */
#include<math.h> /* floor(),ceil(),abs() */
#define TRUE 1
#define FALSE 0
#define OK 1
#define ERROR 0
typedef int Status; /* Status是函数的类型,其值是函数结果状态代码，如OK等 */
typedef int ElementType;
typedef struct PtrToNode
{
  ElementType data;
 struct PtrToNode *prior,*next;
}PtrToNode,*List;

Status InitList(List *L)
{ /* 产生空的双向循环链表L */
  *L=(List)malloc(sizeof(PtrToNode));
  if(*L)
  {
    (*L)->next=(*L)->prior=*L;
    return OK;
  }
  else
    return OVERFLOW;
}

void ListTraverse(List L,void(*visit)(ElementType))
{ /* 由双链循环线性表L的头结点出发,正序对每个数据元素调用函数visit() */
  List p=L->next; /* p指向头结点 */
  while(p!=L)
  {
    visit(p->data);
    p=p->next;
  }
  printf("\n");
}

void vd(ElementType c) /* ListTraverse()调用的函数(类型一致) */
{
  printf("%d ",c);
}

Status ListInsert(List L, ElementType X) {
    List Pre, Tmp;
    Pre = L;  //  前驱结点从头结点开始
    while(Pre->next) {
        if(X < Pre->next->data)
            break; // 找到第一个比x大的结点
        else
            Pre = Pre->next;
        }
    Tmp =(List)malloc(sizeof(PtrToNode));
    Tmp->data = X;   //建立x结点
    Tmp->next = Pre->next;
    Pre->next = Tmp;   // 将x插入Pre后一个位置
    return OK;
}

void main()
{
  List L;
  int i,n,j,d;
  ElementType e;
  InitList(&L);
  printf("初始化链表依次输入：1,2,3,4,5,6,7,8,9\n");
  for(i=1;i<=9;i++)
	ListInsert(L,i); /* 在第i个结点之前插入i */
  ListInsert(L,8);
  ListTraverse(L,vd); /* 正序输出 */

}
