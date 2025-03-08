# Exercise 7: 2x2 Matrix multiplication

    lui  x10, 0x10000   # Load base address of first matrix (A)
    lui  x11, 0x10004   # Load base address of second matrix (B)
    lui  x12, 0x10008   # Load base address for result matrix (C)

    # Load A matrix elements
    lw   x13, 0(x10)    # A[0][0]
    lw   x14, 4(x10)    # A[0][1]
    lw   x15, 8(x10)    # A[1][0]
    lw   x16, 12(x10)   # A[1][1]

    # Load B matrix elements
    lw   x17, 0(x11)    # B[0][0]
    lw   x18, 4(x11)    # B[0][1]
    lw   x19, 8(x11)    # B[1][0]
    lw   x20, 12(x11)   # B[1][1]

    # Compute C[0][0] = A[0][0]*B[0][0] + A[0][1]*B[1][0]
    mul  x21, x13, x17  
    mul  x22, x14, x19  
    add  x21, x21, x22  
    sw   x21, 0(x12)    

    # Compute C[0][1] = A[0][0]*B[0][1] + A[0][1]*B[1][1]
    mul  x21, x13, x18  
    mul  x22, x14, x20  
    add  x21, x21, x22  
    sw   x21, 4(x12)    

    # Compute C[1][0] = A[1][0]*B[0][0] + A[1][1]*B[1][0]
    mul  x21, x15, x17  
    mul  x22, x16, x19  
    add  x21, x21, x22  
    sw   x21, 8(x12)    

    # Compute C[1][1] = A[1][0]*B[0][1] + A[1][1]*B[1][1]
    mul  x21, x15, x18  
    mul  x22, x16, x20  
    add  x21, x21, x22  
    sw   x21, 12(x12)   
