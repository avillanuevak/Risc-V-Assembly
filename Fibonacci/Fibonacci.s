.data
fib: .word 0, 1
.text
start:
    li a0, 20
    la a1, fib
    jal ra, generate_fibonacci
    li a7, 10
    ecall

generate_fibonacci:
    beqz a0, end
    lw a2, 0(a1)
    lw a3, 4(a1)
    add a4, a2, a3
    sw a4, 8(a1)
    addi a0, a0, -1
    addi a1, a1, 4
    jal ra, generate_fibonacci

end:
    ret