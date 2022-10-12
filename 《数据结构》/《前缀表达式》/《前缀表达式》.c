
//Deom _03.c

#include <stdio.h>
#include <stdlib.h>  //库函数工具包
#include <string.h>
#include <ctype.h>

/*变量的值必须是EOF或可用unsigned char类型表示的字符，函数的返回值为int类型*/

#define  N  30
#define  TRUE   1
#define  FALSE  0

typedef struct {
    double data[N];
    int top;
} Stack;

void Push( Stack *ptrs, double item )
{//定义Push（）函数判断栈满继续不满执行指向top 
    if( ptrs->top == N - 1 ){
        printf( "Stack is full.\n" );
        return;
    } else {
        ptrs->data[ ++( ptrs->top ) ] = item; //顶端数据赋值 
        return;
    }
}

double Pop( Stack * ptrs )
{//定义函数Pop（）判断栈的堆积 
    if( ptrs->top == -1 ) {                    //top()取栈顶元素
        printf( "Stack is empty.\n" );
        return 0;                          //栈为空时的情况 
    } else
        return ptrs->data[ ( ptrs->top )-- ]; //栈的指针由上到下 
}

int IsOperator( char ch )
{//定义函数IsOperator();判断输入的字符有无错误 
    if( ch == '+' || ch == '-' || ch == '*' || ch == '/' )  //判断类型"+ -* / " 
        return TRUE;
    else
        return FALSE;
}

double Calculate( double a, double b,char ch )
{//Calculate()函数用于计算表达式
    switch( ch ) {
        case '+' : return a + b; break;
        case '-' : return a - b; break;
        case '*' : return a * b; break;
        case '/' : return a / b;
    }
}

int main()
{
    char expr[N];    //定义字符类型的数组 
    printf("输入需要计算的前缀表达式（注：每个操作数、操作符需空格隔开）：\n");
    gets( expr );    //库函数=scanf（）; 
    //scanf("%[^\n]", expr);
    //scanf("%s", expr);

    int len = strlen( expr );    //调用strlen()函数判断字符长度 
    Stack ss;               //定义栈ss 

    ss.top = -1;             //初始化ss的top值 

    double cc = 1;
    double tem_sum = 0;
    double operand_a;
    double operand_b;
    double result;
    int error = 0;           // 记录除数为0的错误情况
    int i;
    for( i = len - 1; i >= 0; -- i ) {
        if( expr[i] >= '0' && expr[i] <= '9' ) 
		{//数组data的值在0~9之间 
            tem_sum += ( expr[i] - '0' ) * cc;
            cc *= 10;
            if( expr[i-1] == '+' ) {
                //printf( "%d\n", tem_sum );
                Push( &ss, tem_sum );//Push()函数 
                tem_sum = 0;
                cc = 1;
                i -= 2; // 跳过下一个正号和空格
                continue;
            } else if( expr[i-1] == '-' ) {
                tem_sum = -tem_sum;
                //printf( "%d\n", tem_sum );
                Push( &ss, tem_sum ); 
                tem_sum = 0;
                i -= 2; // 跳过下一个负号和空格
                continue;
            } else if( expr[i-1] == ' ' ) { // 一个数字处理完了
                //printf( "%d\n", tem_sum );
                Push( &ss, tem_sum );
                tem_sum = 0;
                cc = 1;
                i --;
                continue;
            }
        } else if( expr[i] == '.' ) {
            tem_sum /= cc * 1.0;
            cc = 1;
        } else if( IsOperator( expr[i] ) ) {
            operand_a = Pop( &ss );
            operand_b = Pop( &ss );
            if( expr[i] == '/' && operand_b == 0 ) {
                error = 1;
                break;
            } else {
                result = Calculate( operand_a, operand_b, expr[i] );
                //printf( "result:%.1lf\n", result );
                Push( &ss, result );
                i--; // 跳过下一个空格
            }
        }
    }
    if( error != 1 )
        printf( "计算结果为: %.1lf\n", Pop( &ss ) );
    else
        printf( "ERROR\n" );

    return 0;
}
