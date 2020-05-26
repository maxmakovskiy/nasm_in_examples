%include "stud_io.inc"
global _start

section .data
        s_array db 'Hello world'

section .bss
        d_array resb 14

section .text
_start: mov ecx, 11
        mov edi, d_array
	mov esi, s_array
again:  mov al, [esi]
	mov [edi], al
	inc edi
	inc esi
	dec ecx
	jnz again
	FINISH
