//* two_func.c -- a program using two functions in one file */
#include <stdio.h>

void butler(void);  /* ANSI/ISO C function prototyping */

int main(void) 
{
    printf("I will summon the butler function.\n");
    butler();
    printf("Yes, Bring me some tea and writable DVDs.\n");

    return 0;
}

void butler(void)   /* start of a function definition*/
{
    printf("You rang, sir?\n");
}
