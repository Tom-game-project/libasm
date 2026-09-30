#include <stdio.h>

int testfunc(void);

int main() {
  int a = testfunc();
  printf("%d \n", a);
  return 0;
}
