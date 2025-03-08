# Exercise 9: Quicksort

quicksort:
    bge  a0, a1, return   # Base case: if left >= right, return

    mv   t0, a0           # Pivot index
    lui  t1, 0x10000      # Load base address of array

    # Load pivot
    slli t2, t0, 2        
    add  t2, t1, t2       
    lw   t3, 0(t2)        

    mv   t4, a0           # i = left
    mv   t5, a1           # j = right

partition:
    # Find left element greater than pivot
    slli t6, t4, 2
    add  t6, t1, t6
    lw   t7, 0(t6)
    ble  t7, t3, inc_left
    j    find_right

inc_left:
    addi t4, t4, 1
    j    partition

find_right:
    # Find right element smaller than pivot
    slli t6, t5, 2
    add  t6, t1, t6
    lw   t7, 0(t6)
    bge  t7, t3, dec_right
    j    swap_values

dec_right:
    addi t5, t5, -1
    j    partition

swap_values:
    # Swap array[i] and array[j]
    slli t6, t4, 2
    add  t6, t1, t6
    lw   t7, 0(t6)

    slli t6, t5, 2
    add  t6, t1, t6
    lw   t8, 0(t6)

    sw   t8, 0(t1)
    sw   t7, 0(t6)

    blt  t4, t5, partition  # Continue partitioning
    j    recursive_calls

recursive_calls:
    addi a1, t4, -1
    jal  ra, quicksort   # Sort left partition

    addi a0, t4, 1
    jal  ra, quicksort   # Sort right partition

return:
    jr   ra
