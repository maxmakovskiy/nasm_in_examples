%include "stud_io.inc"
global _start

section .bss
arr1 resb 5
arr2 resb 2
arr3 resb 7

section .text
; populate arr1 with '@' and print it
_start: mov edi, arr1
	mov ecx, 5
	mov al, '@'
	call fill_memory
	
	mov esi, arr1
	mov ecx, 5
	call print_memory

; populate arr2 with '!' and print it
	mov edi, arr2
	mov ecx, 2
	mov al, '!'
	call fill_memory

	mov esi, arr2
	mov ecx, 2
	call print_memory

; populate arr3 with '=' and print it
	mov edi, arr3
	mov ecx, 7
	mov al, '='
	call fill_memory

	mov esi, arr3
	mov ecx, 7
	call print_memory

	FINISH	

; fill memory (edi=address, ecx=length, al=value)
fill_memory:
	jecxz fm_q
fm_lp:	mov [edi], al
	inc edi
	loop fm_lp
fm_q:	ret

; print memory (esi=address, ecx=length)
print_memory:
	jecxz pr_q
pr_lp:	lodsb
	PUTCHAR al
	loop pr_lp
	PUTCHAR 10
pr_q:	ret

