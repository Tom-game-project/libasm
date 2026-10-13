#include <stdio.h>

int func() {
  int a[3] = {
    1,
    2,
    3,
  };

  printf("%d\n", *(a + 0));
  printf("%d\n", *(a + 1));
  printf("%d\n", *(a + 2));

  *(a + 1) = 100;

  printf("%d\n", a[1]);

  return 0;
}

int main() {
  func();
  printf("pointer size %zu\n", sizeof(char *));
}
