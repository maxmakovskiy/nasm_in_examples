#include <stdio.h>

/*
int numsOfChars(const char* source)
{
	int i;
	
	for (i = 0; source[i] != '\0'; i++) {}	

	return i;
}
*/

int numsOfChars(const char* source)
{
	const char* p;
	
	for (p = source; *p; p++) {}

	return p - source;
}

int main()
{
	char* string = "Hello world";

	int temp = numsOfChars(string);

	printf("Source: %s\n", string);
	printf("Result of computation equals %d\n", temp);

	return 0;
}
