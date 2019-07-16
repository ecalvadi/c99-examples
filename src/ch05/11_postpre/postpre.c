/*postpre.c -- postfix vs prefix*/
#include <stdio.h>

int main(void)
{
    int a = 1, b = 1;
    int a_post, pre_b;
    
    a_post = a++;           /*postfix: a is changed after its value is used*/
    pre_b = ++b;            /*prefix: b is changed before its value is used*/
    
    printf("a  a_post   b    pre_b \n");
    printf("%1d %5d %5d %5d\n", a, a_post, b, pre_b);
    
    return 0;
}
