#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc0\x40\x89\xc3\xcd\x80";


main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
