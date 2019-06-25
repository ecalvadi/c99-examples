//* platinium.c -- yout weight in platinium */
#include <stdio.h>

int main(void)
{
    float weight;   /* user weight */
    float value;    /* platinium equivalent */

    printf("Are you worth you weight in platinium?\n");
    printf("Let's check it out.\n");
    printf("Please enter yout weight in pounds: ");

    /* get input from the user keyboard */
    scanf("%f", &weight);

    /* assume the platinium is $1700 per ounce    */
    /* 14.5833 convert pounds avd. to ounces troy */
    value = 1700.0 * weight * 14.5833;

    printf("You weight in platinium is worth $%.2f.\n", value);
    printf("You are easily worth that! If platinium prices drop, \n");
    printf("eat more to maintain your value.\n");

    return 0;
}
