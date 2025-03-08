# Exercise 8: Implement Fibonacci recursively

fib:
    addi sp, sp, -16    # Allocate stack space
    sw   ra, 12(sp)     # Save return address
    sw   a0, 8(sp)      # Save argument

    li   t0, 1
    ble  a0, t0, base_case  # If n <= 1, return n

    addi a0, a0, -1     # Compute fib(n-1)
    jal  ra, fib        
    sw   a0, 4(sp)      # Save fib(n-1) result

    lw   a0, 8(sp)      # Restore n
    addi a0, a0, -2     # Compute fib(n-2)
    jal  ra, fib        

    lw   t1, 4(sp)      # Load fib(n-1)
    add  a0, a0, t1     # fib(n) = fib(n-1) + fib(n-2)

base_case:
    lw   ra, 12(sp)     # Restore return address
    addi sp, sp, 16     # Deallocate stack space
    jr   ra             # Return
