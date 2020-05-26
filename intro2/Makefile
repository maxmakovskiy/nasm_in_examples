.PHONY: all clean 

all:		execute

clean:
		rm -f hello_mov.o | rm -f hello_mov

hello_mov.o:	hello_mov.asm
		nasm -f elf hello_mov.asm

execute:	hello_mov.o
		ld -m elf_i386 hello_mov.o -o hello_mov
