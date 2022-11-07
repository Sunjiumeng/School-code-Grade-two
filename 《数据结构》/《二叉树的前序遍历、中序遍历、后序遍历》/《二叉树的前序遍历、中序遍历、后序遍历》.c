//Demo_01.c

#include<stdio.h>
#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0
typedef int Status;
#if CHAR
  typedef char TElemType;
  TElemType Nil=' ';
#else
  typedef int TElemType;
  TElemType Nil=0; /* 设整型以0为空 */
#endif
#define MAX_TREE_SIZE 100 /* 二叉树的最大结点数 */
typedef TElemType SqBiTree[MAX_TREE_SIZE]; /* 0号单元存储根结点 */
Status InitBiTree(SqBiTree T)
{
  int i;
  for(i=0;i<MAX_TREE_SIZE;i++)
    T[i]=Nil;
  return OK;
}
Status CreateBiTree(SqBiTree T)
{ /* 按层序次序输入二叉树中结点的值(字符型或整型), 构造顺序存储的二叉树T */
  int i=0;
#if CHAR

#else
  printf("请按层序输入结点的值(整型)，0表示空结点，输999结束。结点数≤%d:\n",MAX_TREE_SIZE);
  while(1)
  {
    scanf("%d",&T[i]);
    if(T[i]==999)
      break;
    if(i!=0&&T[(i+1)/2-1]==Nil&&T[i]!=Nil)
    {
      printf("出现无双亲的非根结点%d\n",T[i]);
      return FALSE;
    }
    i++;
  }
  while(i<MAX_TREE_SIZE)
  {
    T[i]=Nil; /* 将空赋值给T的后面的结点 */
    i++;
  }
#endif
  return OK;
}
Status BiTreeEmpty(SqBiTree T)
{ /* 初始条件: 二叉树T存在 */
  /* 操作结果: 若T为空二叉树,则返回TRUE,否则FALSE */
  if(T[0]==Nil) /* 根结点为空,则树空 */
    return TRUE;
  else
    return FALSE;
}

Status(*VisitFunc)(TElemType);

void InTraverse(SqBiTree T,int e)
{ /* InOrderTraverse()调用 */
  if(T[2*e+1]!=Nil) /* 左子树不空 */
    InTraverse(T,2*e+1);
  VisitFunc(T[e]);
  if(T[2*e+2]!=Nil) /* 右子树不空 */
    InTraverse(T,2*e+2);
}

Status InOrderTraverse(SqBiTree T,Status(*Visit)(TElemType))
{ /* 初始条件: 二叉树存在,Visit是对结点操作的应用函数 */
  /* 操作结果: 中序遍历T,对每个结点调用函数Visit一次且仅一次。 */
  /*           一旦Visit()失败,则操作失败 */
  VisitFunc=Visit;
  if(!BiTreeEmpty(T))
    InTraverse(T,0);
  printf("\n");
  return OK;
}

void PostTraverse(SqBiTree T,int e)
{ /* PostOrderTraverse()调用 */
  if(T[2*e+1]!=Nil) /* 左子树不空 */
    PostTraverse(T,2*e+1);
  if(T[2*e+2]!=Nil) /* 右子树不空 */
    PostTraverse(T,2*e+2);
  VisitFunc(T[e]);
}

Status PostOrderTraverse(SqBiTree T,Status(*Visit)(TElemType))
{ /* 初始条件: 二叉树T存在,Visit是对结点操作的应用函数 */
  /* 操作结果: 后序遍历T,对每个结点调用函数Visit一次且仅一次。 */
  /*           一旦Visit()失败,则操作失败 */
  VisitFunc=Visit;
  if(!BiTreeEmpty(T))
    PostTraverse(T,0);
  printf("\n");
  return OK;
}

void PreTraverse(SqBiTree T,int e)
{ /* PostOrderTraverse()调用 */
  VisitFunc(T[e]);
  if(T[2*e+1]!=Nil) /* 左子树不空 */
    PreTraverse(T,2*e+1);
  if(T[2*e+2]!=Nil) /* 右子树不空 */
    PreTraverse(T,2*e+2);

}

Status PreOrderTraverse(SqBiTree T,Status(*Visit)(TElemType))
{ /* 初始条件: 二叉树T存在,Visit是对结点操作的应用函数 */
  /* 操作结果: 前序遍历T,对每个结点调用函数Visit一次且仅一次。 */
  /*           一旦Visit()失败,则操作失败 */
  VisitFunc=Visit;
  if(!BiTreeEmpty(T))
    PreTraverse(T,0);
  printf("\n");
  return OK;
}

Status visit(TElemType e)
{
  printf("%d ",e);
  return OK;
}

int main()
{
  int n;
  SqBiTree T;
  InitBiTree(T);
  CreateBiTree(T);
  printf("前序遍历二叉树:\n");
  PreOrderTraverse(T,visit);
  printf("中序遍历二叉树:\n");
  InOrderTraverse(T,visit);
  printf("后序遍历二叉树:\n");
  PostOrderTraverse(T,visit);
  return 0;
}
