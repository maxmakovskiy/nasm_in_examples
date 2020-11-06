#include <stdio.h>

char case_up(char c)
{
	if (c >= 'a' && c <= 'z')
	{
		return c - (('Z' - 'A') + 7);
	}
	else
	{
		return c;
	}
}

int main()
{
	char source = 'x';
	
	printf("%c", case_up(source));

	return 0;
}
