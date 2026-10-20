SRC=\
	test_asm.s \
	ft_strlen.s

OBJ = $(SRC:.s=.o)

MODE ?= debug

NAME=libasm.a

ifeq ($(MODE), release)
	CFLAGS :=
else
	CFLAGS := -g
endif

TESTC=test.c
TEST_OUT=test_exe

# commands
CC=cc
NASM=nasm
AR=ar
RM=rm -f
QEMU=qemu-system-x86_64
GDB=gdb

all: $(NAME)

%.o: %.s
	$(NASM) -f elf64 $< -o $@

$(NAME): $(OBJ)
	$(AR) rcs $@ $^

# qemuで実行
run: 
	$(QEMU) 

test: $(TESTC) $(NAME)
	$(CC) $(CFLAGS) $(TESTC) $(NAME) -o $(TEST_OUT)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME) $(TEST_OUT)

.PHONY: all test clean fclean run
