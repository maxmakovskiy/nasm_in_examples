%include "stud_io.inc"
global _start

section .bss
darr resb 10

section .text
_start: mov ecx, 10
	mov edi, darr
	mov al, 97
	cld
lp:	stosb
	inc al
	loop lp

	mov ecx, 10
	mov esi, darr

prnt:	lodsb
	PUTCHAR al
	loop prnt
	FINISH
