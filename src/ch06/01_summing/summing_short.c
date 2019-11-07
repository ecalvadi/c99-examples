/* summing_short.c -- sums integers entered iteratively, short way */
#include <stdio.h>

int main(void)
{
  long num;
  long sum = 0L;            /*Initializing sum to Zero (long)*/
  int status;

  printf("Please enter an integer to be summed ");
  printf("(q to quit): ");

  while( scanf("%ld", &num) == 1) /* == means 'is equal to' */   
  {
    sum = sum + num;

    printf("Please enter next integer (q to quit): ");
  }

  printf("Those integers sum to %ld\n", sum);

  return 0;
}
