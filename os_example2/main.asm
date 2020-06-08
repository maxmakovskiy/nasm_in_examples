global _start

section .text
; const
newline db 10, 0

; main program
_start:	
	; argc
	mov ebx, [esp]
	mov esi, esp
	; argv
	add esi, 4
	; argv[i] - push to stack address of string
lp:	push dword [esi]
	call print
	add esp, 4
	push dword newline
	call print
	add esp, 4
	; next
	add esi, 4
	dec ebx
	jnz lp

	; exit
	mov ebx, 0
	mov eax, 1
	int 80h

; subroutine
; print([ebp+8]=address of string)
print:
	push ebp ; save ebp
	mov ebp, esp
	push ebx ; save ebx
	mov ebx,  [ebp+8]
	push ebx ; push address of string to stack 
	call strlength
	add esp, 4 ; clean stack
	mov edx, eax ; load result of strlength to EDX
	mov ecx, ebx ; address of string
	mov ebx, 1 ; stdout
	mov eax, 4 ; write
	int 80h ; syscall
	; restore ebx, ebp
	pop ebx
	mov esp, ebp
	pop ebp
	ret

; subroutine
; strlength([ebp+8]=address of string)
; returns legnth of string via EAX
strlength:
	push ebp ; save ebp
	mov ebp, esp
	xor eax, eax
	mov ecx, [ebp+8] ; load arg1 to ecx
.lp:	cmp byte [eax+ecx], 0
	jz .quit
	inc eax
	jmp short .lp
	; restore ebp
.quit:	pop ebp
	ret

