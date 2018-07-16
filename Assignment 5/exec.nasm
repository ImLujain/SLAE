00000000  6A0B              push byte +0xb ; call execv function 
00000002  58                pop eax 
00000003  99                cdq ; zero out edx 
00000004  52                push edx
00000005  66682D63          push word 0x632d ; push -c to the stack 
00000009  89E7              mov edi,esp
0000000B  682F736800        push dword 0x68732f ; push hs/
00000010  682F62696E        push dword 0x6e69622f ; push nib/
00000015  89E3              mov ebx,esp 
00000017  52                push edx
00000018  E803000000        call 0x20 
0000001D  6C                insb       ; our CMD command "ls"
0000001E  7300              jnc 0x20 ; our CMD command "ls"
00000020  57                push edi
00000021  53                push ebx
00000022  89E1              mov ecx,esp
00000024  CD80              int 0x80

