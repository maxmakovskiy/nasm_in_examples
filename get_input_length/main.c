#include <stdio.h>


int main()
{
	int character, counter;
	counter = 0;

	while((character = getchar()) != EOF)
	{
		if (character == '\n')
		{
			printf("Length of current string equals to %d\n", counter);
			counter = 0;
		}
		else
		{
			counter++;
		}
	}

	return 0;
}

