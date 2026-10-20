#include <stdio.h>
#include <string.h>
#include <stdint.h>

int testfunc(void);
size_t ft_strlen(const char *s);
char *ft_strcpy(char *dest, const char *src);

int main() {
  char s[] = "hello world";
  int a = testfunc();

  printf("%d \n", a);

  printf("sizeof %zd byte\n", sizeof(char *));

  printf("%p\n", s);
  uintptr_t addr = (uintptr_t)s;
  printf("Split    : 0x%08x_%08x\n", 
       (unsigned int)(addr >> 32), 
       (unsigned int)(addr & 0xFFFFFFFF));
  printf("ft_strlen.s %zu\n", ft_strlen(s + 1));
  return 0;
}
