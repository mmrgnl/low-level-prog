#include <stdlib.h>
#include "k-stat.h"

unsigned int test(int arr[], size_t arr_size, size_t k_stat, int expected)
{
    int k = get_kstat(arr, arr_size, k_stat);
    return k == expected;
}