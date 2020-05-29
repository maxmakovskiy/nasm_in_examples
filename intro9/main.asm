%include "stud_io.inc"
global _start

section .data
mstr db 'Hello world'

section .text
_start: mov edi, mstr
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
	PRINT 'mstr has '
	PUTCHAR al
	jmp quit
els:	PRINT 'mstr does not has '
	PUTCHAR al
quit:	FINISH	
