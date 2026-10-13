#include <stdio.h>

int testfunc(void);
size_t ft_strlen(const char *s);
char *ft_strcpy(char *dest, const char *src);

int main() {
  int a = testfunc();
  printf("%d \n", a);
  printf("ft_strlen.s %zu\n", ft_strlen("hello world"));
  return 0;
}
