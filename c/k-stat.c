#include "k-stat.h"

void swap(int* item_1, int* item_2)
{
    int temp = *item_2;
    *item_2 = *item_1;
    *item_1 = temp;
}

void buble_sort(int input_arr[], size_t arr_size)
{
    for(size_t i = arr_size; i > 0; i--)
    {
        for (size_t j = 0; j < (i-1); j++)
        {
            if(input_arr[j] > input_arr[j+1])
                swap(&input_arr[j], &input_arr[j + 1]);
        }
    }
}

int get_kstat(int input_arr[], size_t arr_size, size_t k_stat)
{
    buble_sort(input_arr, arr_size);
    return input_arr[k_stat - 1];
}