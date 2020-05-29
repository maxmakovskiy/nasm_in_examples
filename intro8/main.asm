%include "stud_io.inc"
global _start

section .data
buf1 db 'This is a string'
buf2 db 'long '

section .bss
buf3 resb 21

section .text
_start: std
	mov edi, buf3+20
	mov esi, buf1+15
	mov ecx, 6
	rep movsb

	mov esi, buf2+4
	mov ecx, 5
	rep movsb

	mov esi, buf1+9
	mov ecx, 10
	rep movsb


; =======================
; Print buf3          ===
; =======================

	cld
	mov ecx, 21
	mov esi, buf3
lp:	lodsb
	PUTCHAR al
	loop lp	
	FINISH

