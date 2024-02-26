.data
arr_len: .word 9
arr_in: .word 13, 7, -15, 2, 59, -5, 23, 72, -73
k_stat: .word 3

.text #секция код программы
__start:
  .globl __start
  call main
  
finish:
  mv a1, zero # return 0
  addi a0, zero, 17 #syscall number 17(terminate)
  ecall #делаем системный вызов
  
main:

  # загрузка значений в аргументы 
  la a0, arr_len 
  lw a0, arr_len 
  
  la a1, arr_in
  
  la a2, k_stat
  lw a2, k_stat
  # загрузка значений в аргументы 
  
  # сохраняем ra в стэк
  sw ra, 0(sp)
  addi sp, sp, -4
  
  call get_k_stat
  
  # загружем ra из стэка
  addi sp, sp, 4
  lw ra, 0(sp)
  
  ret
  
# a0 -- Размер входного массива
# a1 -- Адрес входного массива
# a2 -- K-статистика
# a3 -- возвращаемое значение
# sp -- указатель на конец стека
get_k_stat:
  # сохраняем ra Return address в стэк Stack pointer
  sw ra, 0(sp)
  addi sp, sp, -4 
  
  call bubble_sort
  
  # загружем ra из стэка
  addi sp, sp, 4
  lw ra, 0(sp)
  
  mv t0, a1
  mv t1, a2
  
  slli t1, t1, 2 # умножаем на 4, чтобы получить нужный сдвиг в массиве
  add t0, t0, t1
  lw a3, 0(t0) #Сохраняем результат в регистре a3
  
  ret

# a0 -- Размер входного массива
# a1 -- Адрес входного массива
bubble_sort:
  mv t0, a1
  mv t1, a0 #внешний счетчик
  outer_loop:
    addi t1, t1, -1
    beq t1, zero, return
    li t2, 0 #внутренний счетчик
    la t0, arr_in
  inner_loop:
    lw t3, 0(t0) #загружем эелементы
    lw t4, 4(t0)
    blt t3, t4, loop_back
  
    #меняем элементы местами, если второй меньше
    sw t3, 4(t0)
    sw t4, 0(t0)
  loop_back:
    addi t2, t2, 1
    addi t0, t0, 4
    beq t1, t2, outer_loop
    j inner_loop #Если t1 == t2, то выходим из внутреннего цикла
  
  return:
    ret
  
