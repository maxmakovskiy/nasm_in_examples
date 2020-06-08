global _start

; Program without using stud_io.inc

section .data
msg db 'Hello world', 10
len equ $-msg

section .text
_start:	mov eax, 4	; write
	mov ebx, 1	; output to console
	mov ecx, msg	; string address
	mov edx, len	; length of string
	int 80h		; syscall

	mov eax, 1	; exit
	mov ebx, 0	; "ok" code
	int 80h		; syscall
