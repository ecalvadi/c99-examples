/*praise2 -- Uses an assortment of string, and get string size*/
/*Try the %u or %lu specifiers if your implementation
 * does not recognize the %zd specifier*/
#include <stdio.h>
#include <string.h>     /* provides strlen() prototype */

#define PRAISE "You are an extraordinary beign."

int main(void)
{
    char name[40];

    printf("What's your name? ");
    scanf("%s", name);

    printf("Hello, %s. %s\n", name, PRAISE);

    printf("Your name of %zd letters occupies %zd memmory cells.\n",
            strlen(name), sizeof(name));

    printf("The phrase of praise has %zd letters ", strlen(PRAISE));
    printf("and occupies %zd memmory cells.\n", sizeof(PRAISE));

    return 0;
}
