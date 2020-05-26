%include "stud_io.inc"
global _start

section .data
s_arr db 65, 66, 67 

section .text
_start: mov ecx, 3
	mov esi, s_arr

	PRINT 'SOURCE ARRAY:'
	PUTCHAR 10

cp:	mov al, [esi]
	PUTCHAR al
	PUTCHAR 32
	inc esi
	dec ecx
	jnz cp

	PUTCHAR 10
	PRINT 'RESULT ARRAY:'
	PUTCHAR 10

	mov ecx, 3
	mov esi, s_arr

again:	add byte [esi], 3 
	mov al, [esi]
	PUTCHAR al
	PUTCHAR 32
	inc esi
	dec ecx 
	jnz again
	FINISH
