#include <stdio.h>

/*
void string_copy(char *dest, const char *source)
{
	int i;
	for (i = 0; source[i]; i++)
	{
		dest[i] = source[i];
	}
	dest[i] = 0;
}
*/

void string_copy(char *dest, const char *source)
{
	for (; *source; source++, dest++)
	{
		*dest = *source;
	}
	*dest = 0;
}

int main()
{
	char *src = "Hello world";
	char dest[11];

	string_copy(dest, src);

	printf("Source: %s\n", src);
	printf("Destination: %s\n", dest);

	return 0;
}
