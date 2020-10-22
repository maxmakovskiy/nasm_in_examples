global _start

section .bss
temp 	resb 20
reverse resb 20

section .data
new_line db 10

section .text
reverse_line:
	push ebp
	mov ebp, esp

	push esi
	push edi
	
	mov esi, [ebp+12]
	mov edi, [ebp+8]

	mov ecx, eax
.repeat:
	push dword [esi]
	inc esi  
	loop .repeat

	mov ecx, eax
.rev_rep:
	pop dword eax 
	mov [edi], al 
	inc edi
	loop .rev_rep

	pop edi
	pop esi

	mov esp, ebp
	pop ebp
	ret

_start:
	; read
	mov eax, 3
	mov ebx, 1
	mov ecx, temp
	mov edx, 20
	int 80h

	; analyze EAX after read syscall
	; if ffff f000h =< EAX =< ffff ffffh 
	; then ERROR was occur in read syscall
	cmp eax, 0fffff000h
	jae exit		

	; reverse procedure
	push eax
	push dword temp
	push dword reverse
	call reverse_line	
	add esp, 12 

	; write
	mov eax, 4
	mov ebx, 1
	mov ecx, reverse 
	mov edx, 20
	int 80h

	; write
	mov eax, 4
	mov ebx, 1
	mov ecx, new_line 
	mov edx, 1
	int 80h

exit:
	; exit
	mov eax, 1
	mov ebx, 0
	int 80h





