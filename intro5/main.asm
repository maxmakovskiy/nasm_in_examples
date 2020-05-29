%include "stud_io.inc"
global _start

section .data
txt db "Hello, World!"

section .text
_start: mov esi, txt
	mov ecx, 12
	cld
lp:	lodsb
	PUTCHAR al
	PUTCHAR 10
	loop lp
	FINISH
