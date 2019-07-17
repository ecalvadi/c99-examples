/*addemup.c -- five kind of statements*/
#include <stdio.h>

int main(void)                      /*finds sum of first 20 integers*/
{
    int count, sum;                 /*declaration statement*/

    count = 0;                      /*assignment statement*/
    sum = 0;                        /*assignment statement*/

    while (count++ < 20)            /*while*/
        sum = sum + count;          /*  statement*/

    printf("sum = %d\n", sum);      /*function statement*/

    return 0;                       /*return statement*/
}
