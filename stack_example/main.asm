%include "stud_io.inc"
global _start

section .data
; EQUALS
;string  dd 'abc'
;pattern dd 'abc'

; EQUALS
;string  dd 'abc'
;pattern dd '*'

; EQUALS
string  dd 'abc'
pattern dd '?bc'

section .text
_start: push dword pattern
	push dword string
	call match
	add esp, 8
	test eax, eax
	jz print_no
	PRINT "EQUALS"
	jmp fnsh
print_no:
	PRINT "NOT EQUALS"
fnsh:
	PUTCHAR 10
	FINISH

; match (pattern=[ebp+8], string=[ebp+12])
match:
; Organize frame
	push ebp
	mov ebp, esp
	sub esp, 4
; Save esi and edi
	push esi
	push edi
; Load params: string's address and pattern's address 
	mov esi, [ebp+8]
	mov edi, [ebp+12]

.again:	
	cmp byte [edi], 0
	jne .not_end
	cmp byte [esi], 0
	jne near .false
	jmp .true

.not_end:
	cmp byte [edi], '*'
	jne .not_star
	; i := 0
	mov dword [ebp-4], 0
	
.star_loop:
	mov eax, edi
	inc eax
	push eax
	mov eax, esi
	add eax, [ebp-4]
	push eax
	call match
	add esp, 8
	test eax, eax
	jnz .true
	
	add eax, [ebp-4]
	cmp byte [esi+eax], 0
	je .false
	inc dword [ebp-4]
	cmp byte [esi+eax], 0
	je .false
	inc dword [ebp-4]
	jmp .star_loop

.not_star:
	mov al, [edi]
	cmp al, '?'
	je .quest
	cmp al, [esi]
	jne .false
	jmp .goon

.quest:
	cmp byte [esi], 0
	jz .false

.goon:
	inc esi
	inc edi
	jmp .again

.true:
	mov eax, 1
	jmp .quit

.false:
	xor eax, eax

.quit:
	pop edi
	pop esi
	mov esp, ebp
	pop ebp
	ret

