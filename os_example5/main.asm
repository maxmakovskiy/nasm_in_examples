global _start

section .data
enter_msg db "Enter file name (20 chars): "
enter_msg_length equ $-enter_msg
content_msg db "Enter contents(50 chars): "
content_msg_length equ $-content_msg

section .bss
file_name resb 20
file_name_0 resb 21
file_content resb 50

section .text
; ===================
; [ebp+16] - length of source
; [ebp+12] - source
; [ebp+8]  - destination
add_0_to_string:
	push ebp
	mov ebp, esp
	
	push esi
	push edi
	push edx

	mov ecx, [ebp+16]
	mov esi, [ebp+12]
	mov edi, [ebp+8]
.copy:	
	mov dl, [esi]
	; drop 'new line character' (0xA)
	cmp dl, 0ah
	je .exit
	mov [edi], dl 
	inc esi
	inc edi
	loop .copy
.exit:
	; add 0 to destination
	mov byte [edi], 0

	pop edx
	pop edi
	pop esi

	mov esp, ebp
	pop ebp
	ret

; ===================
_start:
	; write enter_msg
	mov eax, 4
	mov ebx, 1
	mov ecx, enter_msg
	mov edx, enter_msg_length
	int 80h
	; analyze result of write syscall
	cmp eax, -1
	je exit

	; read for getting file_name
	mov eax, 3 
	mov ebx, 0	
	mov ecx, file_name
	mov edx, 20
	int 80h
	; analyze result of read syscall
	cmp eax, 0fffff000h
	jae exit

	; concat procedure: file_name + '0'
	push eax ; length of file_name
	push file_name ; source 
	push file_name_0 ; destination
	call add_0_to_string
	add esp, 12 ; clear args from stack	

	; open - create new file descriptor
	mov eax, 5
	mov ebx, file_name_0 
	mov ecx, 001h
	int 80h
	; analyze result of open syscall
	cmp eax, -1
	je exit
	; save new file descriptor
	push eax

	; write content_msg
	mov eax, 4
	mov ebx, 1
	mov ecx, content_msg
	mov edx, content_msg_length
	int 80h
	; analyze result of write syscall
	cmp eax, -1
	je exit
	; save number of reading chars
	push eax

	; read for getting file_content
	mov eax, 3
	mov ebx, 0
	mov ecx, file_content
	mov edx, 50
	int 80h
	; analyze result of read syscall
	cmp eax, 0fffff000h
	jae exit

	; write contents to file	
	mov eax, 4
	pop edx
	pop ebx
	mov ecx, file_content 
	int 80h	

	; close file
	mov eax, 6
	mov ebx, edx
	int 80h

exit:
	mov eax, 1
	mov ebx, 0
	int 80h

