%include "stud_io.inc"
global _start

section .data
string db 'Hello world'

section .text
_start: mov edi, string 
; Sought value
;	mov al, 'm'
	mov al, 'e'
	mov ecx, 11
	cld
	repnz scasb
; If ECX == 0 then
; <mstr> doesn't contain <character>
; Else ECX !=0 then we find <character> in <mstr>
	cmp ecx, 0
	jz els
	PRINT 'string has '
	PUTCHAR al
	jmp quit
els:	PRINT 'string does not has '
	PUTCHAR al
quit:	FINISH	
