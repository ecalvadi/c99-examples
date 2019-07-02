/*badcount.c -- incorrect arguments count*/
#include <stdio.h>

int main(void)
{
    int n, m;
    float f, g;

    n = 4;
    m = 5;

    f = 7.0f;
    g = 8.0f;

    printf("%d\n", n, m);       /*too many arguments*/
    printf("%d %d %d\n", n);    /*too few arguments*/
    printf("%d %d\n", f, g);    /*wrong kind of values*/

    return 0;
}
