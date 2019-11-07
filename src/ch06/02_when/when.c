//when.c when a loop quits
#include <stdio.h>

int main (void)
{
  int n = 5;

  while ( n < 7 )                       // line 8
  {
    printf("n = %d\n", n );
    n++;                                // line 11
    printf("now n = %d\n", n );         // line 12
  }

  printf("The loop has finished.\n");

  return 0;
}
