%include "stud_io.inc"
global _start

section .data
sarr db "Hello world!"

section .bss
darr resb 12

section .text
_start:	mov ecx, 12 
	mov esi, sarr
	mov edi, darr
	cld
	rep movsb

	mov ecx, 12
	mov esi, sarr
lp:	lodsb
	PUTCHAR al
	loop lp

	FINISH
