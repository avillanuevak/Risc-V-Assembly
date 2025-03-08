# Exercise 6: String Length Calculation
# Compute the length of a null-terminated string stored in memory

    lui  x10, 0x10000   # Load base address of string
    addi x11, x0, 0     # Initialize length counter
string_length_loop:
    lb   x12, 0(x10)    # Load byte from string
    beq  x12, x0, string_length_end # If null terminator, end loop
    addi x11, x11, 1    # Increment length
    addi x10, x10, 1    # Move to next character
    j    string_length_loop
string_length_end:
