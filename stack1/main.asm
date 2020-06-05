%include "stud_io.inc"
global _start

; Reverse string and print it

section .data
src db "Hello String!"

section .text
_start: xor ebx, ebx
	xor ecx, ecx
	mov esi, src

lp:	mov bl, [esi+ecx]
	cmp bl, 0
	je lpquit
	push ebx
	inc ecx
	jmp lp

lpquit:	jecxz done
	mov edi, esi

lp2:	pop ebx
	mov [edi], bl
	inc edi
	loop lp2

	mov ecx, 13
prnt:	lodsb
	PUTCHAR al
	loop prnt

done:	FINISH
