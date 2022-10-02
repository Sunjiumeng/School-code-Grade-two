#include<stdio.h>
main() {
    int a[11]={2,3,4,5,7,8,9,11,34,56};
    int i,j,x;
    printf("请输入需要插入的数据：\n");
    scanf("%d",&x);
    for(i=9; i>=0; i--) {
        if(a[i]>x)
            a[i+1]=a[i];
        else
            break;
    }
    a[i+1]=x;
    for(i=0;i<11;i++)
        printf("%d ",a[i]);
}
