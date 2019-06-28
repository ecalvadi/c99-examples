/*print1.c- display some properties of printf()*/
#include <stdio.h>

int main(void)
{
    int ten = 10;
    int two = 2;

    printf("Doing it right: ");
    printf("%d minus %d is %d\n", ten, two, ten - two);

    printf("Doing it wrong: ");
    printf("%d minus %d is %d\n", ten); /*forgot 2 arguments*/

    return 0;
}
