#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x29\xc0\xb0\x01\x89\xc3\xcd\x80";


main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
