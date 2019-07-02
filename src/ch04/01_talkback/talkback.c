/*talkback.c -- nosy, informative program*/
#include <stdio.h>
#include <string.h>         /*for strlen() prototype*/

#define DENSITY 62.4        /*Human density in lbs per cu ft*/

int main(void)
{
    float weight, volume;
    int size, letters;
    char name[40];          /*name is an array of 40 chars*/

    printf("Hi!, What's is your first name?\n");
    printf("________________________________________\r");
    scanf("%s", name);

    printf("%s, what's is your weight in pounds?\n", name);
    printf("_______________\r");
    scanf("%f", &weight);

    size = sizeof(name);
    letters = strlen(name);
    volume = weight / DENSITY;

    printf("Well, %s, your volume is %2.2f cubic feet.\n", name, volume);
    printf("Also, yout first name has %d letters,\n", letters);
    printf("and we have %d bytes to store it.\n", size);

    return 0;
}
