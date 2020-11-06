#include <math.h>
#include <stdlib.h>
#include <stdio.h>

int main()
{
	double *pointer;
	pointer = malloc(360 * sizeof(double));

	int i;
	for (i = 0; i < 360; i++)
	{
		pointer[i] = sin((2*M_PI/360.0) * (double)i);
	}

	for (i = 0; i < 360; i++)
	{
		printf("%f", pointer[i]);
	}


	free(pointer);
	return 0;
}
