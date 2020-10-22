global _start

section .data
string db "Hello World", 10
string_length equ $-string

section .text
_start:	mov eax, 4
	mov ebx, 1
	mov ecx, string
	mov edx, string_length
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h
