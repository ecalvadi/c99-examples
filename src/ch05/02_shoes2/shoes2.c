/*shoes2.c--calculates foot lengths for several sizes*/
#include <stdio.h>

#define ADJUST 7.31                 /*one kind of symbolic constant*/

int main(void)
{
    const double SCALE = 0.333;     /*another kind of symbolic constant*/

    double shoe, foot;

    printf("Shoe size (men's)     foot length\n");
    shoe = 3.0;

    while (shoe < 18.5)             /*Starting the while loop*/
    {                               /*Start of block*/
        foot = SCALE * shoe * ADJUST;
        printf("%10.1f %15.2f inches\n", shoe, foot);

        shoe = shoe + 1.0;
    }                               /*End of block*/

    printf("If the shoe fits, wear it.\n");

    return 0;
}
