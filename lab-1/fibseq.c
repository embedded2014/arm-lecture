#include <stdio.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;

  printf("Please input a number:");

  if (scanf("%d",&number) == 1) {
    result = fibonacci(number);
    printf("The fibonacci sequence at %d is: %d\n", number, result);
  }

  return 0;
}

