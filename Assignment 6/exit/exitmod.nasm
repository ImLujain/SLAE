global _start
section .text
_start:

	sub eax,eax; change from xor to sub
	mov al, 0x1 ; moving 1 to eax instead of increment
	mov ebx,eax
	int 0x80
