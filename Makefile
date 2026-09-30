SRC=\
	test_asm.s

OBJ = $(SRC:.s=.o)

NAME=libasm.a

TESTC=test.c
TEST_OUT=test_exe

# commands
CC=cc
NASM=nasm
AR=ar
RM=rm -f

all: $(NAME)

%.o: %.s
	$(NASM) -f elf64 $< -o $@

$(NAME): $(OBJ)
	$(AR) rcs $@ $^

test: $(TESTC) $(NAME)
	$(CC) $(TESTC) $(NAME) -o $(TEST_OUT)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME) $(TEST_OUT)

.PHONY: test
