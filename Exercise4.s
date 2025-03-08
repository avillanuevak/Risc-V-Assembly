# Exercise 4: Array Sum
# Sum all elements of an array stored in memory

    lui  x10, 0x10000   # Load base address of array
    addi x11, x0, 5     # Number of elements in array
    addi x12, x0, 0     # Initialize sum to 0
sum_loop:
    lw   x13, 0(x10)    # Load array element
    add  x12, x12, x13  # Add element to sum
    addi x10, x10, 4    # Move to next element
    addi x11, x11, -1   # Decrement counter
    bne  x11, x0, sum_loop # Repeat until all elements are summed
