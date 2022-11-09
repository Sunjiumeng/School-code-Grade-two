（一）冒泡排序
//Deom_08_1(bubble_sort).c
#include <stdio.h>
void bubble_sort(int arr[], int len) {
        int i, j, temp;
        for (i = 0; i < len - 1; i++) //change's times
                for (j = 0; j < len - 1 - i; j++)//change's numbers
                        if (arr[j] > arr[j + 1]) {
                                temp = arr[j];
                                arr[j] = arr[j + 1];
                                arr[j + 1] = temp;
                        }
}  // if (arr[j] > arr[j + 1]) change 
int main() {
        int arr[] = {49,38,65,97,76,13,27,49};
        int len = (int) sizeof(arr) / sizeof(*arr); //Get follow_space of arr[].
        bubble_sort(arr, len);  //into funtion(bubble_sort()) to sort
        int i;
        for (i = 0; i < len; i++)
                printf("%d ", arr[i]); //printf answer
        return 0;
}
