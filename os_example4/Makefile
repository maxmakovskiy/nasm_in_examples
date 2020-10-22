.PHONY: all clean

all:	exect

clean:	
	rm -f main | rm -f main.o

main.o: main.asm
	nasm -g -f elf main.asm

exect:	main.o
	ld -m elf_i386 main.o -o main



