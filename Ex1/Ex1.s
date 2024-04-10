.data
xx: .word 5
yy: .word 0
.text
inici:
 la a0, xx
lw a1, 0(a0)
sw a1, 4(a0)
addi a1, a1, -1
beqz a1, inici
sub zero, a2, a1
end:
 j end 
