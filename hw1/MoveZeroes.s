main:
    li s0 0                    #array base addr
    addi s1 x0 5               #array_size = 5
    
    #start filling up array [1,0,0,2,5]
    li t0 1
    sw t0 0(s0)
    li t0 0
    sw t0 4(s0)
    sw t0 8(s0)
    li t0 2
    sw t0 12(s0)
    li t0 5
    sw t0 16(s0)
    
    
    #call function moveZeroes
    jal t6 moveZeroes
    
    #Print Result Array
    #li     a0, 0                # return 0
    lw a0 0(s0)                  # print s[0]
    jal printInt
    lw a0 4(s0)                  # print s[1]
    jal printInt
    lw a0 8(s0)                  # print s[2]
    jal printInt
    lw a0 12(s0)                  # print s[3]
    jal printInt
    lw a0 16(s0)                  # print s[4]
    jal printInt
    li     a7, 10                # Exit code
    ecall
moveZeroes:
    li s2 0 #next non zero index
    addi s3 x0 -1 # i = -1
    addi t1 x0 0
    loop:
        addi s3 s3 1             #i++
        bge s3 s1 exit           #i >= array_size exit
        slli t1 s3 2             #i*4
        add t1 s0 t1             #array + i*4
        lw t3 0(t1)              #t3 = array[i]
        beq t3 x0 loop
        slli t2 s2 2             #next_nonzero_index * 4
        add t2 t2 s0             #array + next_nonzero_index * 4
        sw t3 0(t2)              #array[next_nonzero_index] = array[i]
        beq s2 s3 do             #if(next_nonzero_index != i)
        sw x0 0(t1)              #store 0 to array[i]
    do:
        addi s2 s2 1             #next_nonzero_index++
        j loop
 
 exit:
    jr t6

printInt:
    li a7, 1
    ecall
    jr ra
    
    
