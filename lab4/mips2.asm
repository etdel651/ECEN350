global
main:
Li $a0,5 # f(5,4)
LI $a1, 4 # 
jal f
LI $V0, 10
syscall 

f: 
beq a0, $0, Base
addi, $s0, $a1, 2
sll $t0, $a0, 2       #4n
add $s0, $s0, $t0  #b+4n
addi $a0, $a0, -1 #f(n-1)
addi $a1, $a1, 1 #f(k+1)
addi $sp,$sp, -12
sw, $a0, 0($sp)
sw, $a1, 4($sp)
sw, $s0, 8($sp)
sw, ra, 12($sp)
jal f 
lw, $a1, 4($sp)
addi $sp,$sp, 4
add $s0,$v0, $s0 # b+4n+(f(n-1,k+1)
add $v0,$s0,$a1
lw, $a0, 0($sp)
lw, $s0, 8($sp)
lw, ra, 12($sp)
addi $sp,$sp, 12
jr $ra
addi $sp,$sp, -12
sw, $a0, 0($sp)
sw, $a1, 4($sp)
sw, $s0, 8($sp)
sw, ra, 12($sp)


Base:
Li, $s0,8    # if(n==0) b=8;
add, $v0,$s0,$a1
lw, $a0, 0($sp)
lw, $a1, 4($sp)
lw, $s0, 8($sp)
lw, ra, 12($sp)
addi $sp,$sp, 12