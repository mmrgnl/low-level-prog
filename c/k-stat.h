#ifndef K_STAT_LIB
#define K_STAT_LIB

#include <stddef.h>

void swap(int* item_1, int* item_2);
void buble_sort(int input_arr[], size_t arr_size);
int get_kstat(int input_arr[], size_t arr_size, size_t k_stat);

unsigned int test(int arr[], size_t arr_size, size_t k_stat, int expected);

#endif //K_STAT_LIB
