/*input.c -- when to use &*/
#include <stdio.h>

int main(void)
{
    int age;            /*Variable*/
    float assets;       /*Variable*/
    char pet[30];       /*String*/

    printf("Enter your age and assets: ");
    scanf("%d %f", &age, &assets);          /*use the & here*/

    printf("Enter your favorite pet: ");
    scanf("%s", pet);                       /*no & for char array*/

    printf("%d %.2f %s\n", age, assets, pet);

    return 0;
}
