# Exercise 3: Factorial Calculation

    addi x10, x0, 5     # Load the number (n = 5) into x10
    addi x11, x0, 1     # Initialize factorial result as 1
factorial_loop:
    beq  x10, x0, factorial_end # If n == 0, end loop
    mul  x11, x11, x10  # Multiply result by n
    addi x10, x10, -1   # Decrement n
    j    factorial_loop
factorial_end:
