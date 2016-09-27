la $a0,2 
la $a1, 4

f:
addi $s0, $a1, 2                         # b=k+2
bne $a0, $0, else                       # if n!=0 go to else
li $s0, 8                                      #b=8
add $v0, $s0, $a1                     #return b+k
jr $ra

else:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $s0, 12($sp)

addi $a0, $a0, -1                       #n-1
addi $a1, $a1, 1                        #k+1
jal f

lw $ra, 0($sp)
lw $a0, 4($sp)
lw $a1, 8($sp)
lw $s0, 12($sp)
addi $sp, $sp 8

sll $t0, $a0, 2                           #4*n
add $s0, $t0, $s0                     #b+4*n
add $s0, $s0, $v0                    #b+4*n+f(n-1,k+1)
add $v0, $a1, $s0                    #return b+k