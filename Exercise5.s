# Exercise 5: Find Maximum in an Array
# Iterate through an array and find the maximum value

    lui  x10, 0x10000   # Load base address of array
    addi x11, x0, 5     # Number of elements in array
    lw   x12, 0(x10)    # Load first element as initial max
    addi x10, x10, 4    # Move to next element
find_max_loop:
    lw   x13, 0(x10)    # Load array element
    blt  x12, x13, update_max
    j    continue
update_max:
    add  x12, x13, x0   # Update max
continue:
    addi x10, x10, 4    # Move to next element
    addi x11, x11, -1   # Decrement counter
    bne  x11, x0, find_max_loop # Repeat until end of array
