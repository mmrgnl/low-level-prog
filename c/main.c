#include <stdio.h>
#include <stdlib.h>
#include "k-stat.h"

int main()
{
    if (test((int[]){3, 2, 1}, 3, 2, 2))
        printf("Test #1 PASSED\n");
    else
        printf("Test #1 FAILED\n");

    if (test((int[]){1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, 10, 5, 5))
        printf("Test #2 PASSED\n");
    else
        printf("Test #2 FAILED\n");

    if (test((int[]){0}, 1, 1, 0))
        printf("Test #3 PASSED\n");
    else
        printf("Test #3 FAILED\n");

    if (test((int[]){5, 7, 12, 7}, 4, 2, 7))
        printf("Test #4 PASSED\n");
    else
        printf("Test #4 FAILED\n");

    if (test((int[]){11, 0, 12, 8}, 4, 3, 11))
        printf("Test #5 PASSED\n");
    else
        printf("Test #5 FAILED\n");
}