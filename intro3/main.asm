%include "stud_io.inc"
global _start

section .data
source db 'Hello World'

section .text
_start:	mov ecx, 11
	mov edi, source
again:	mov al, [edi]
	PUTCHAR al
	inc edi
	dec ecx
	jnz again
	FINISH
