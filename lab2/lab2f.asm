.data
alpha:	.ascii "abcdefghijklmnopqrstuvwxyz"
.text
.globl main

main:
 	addu $s0, $0, $ra	#save the return address
 	li $v0, 5		#syscall for read_int
 	add $t0, $0, $0
 	syscall
 	add $s1, $v0, $0
 	la $a1, alpha
compare:
 	bne $s1, $t0, print
 	jr $ra
print:
 	lb $a0, 0($a1)
 	li $v0, 11
 	syscall
 	addi $t0, $t0, 1
 	addi $a1, $a1, 1
 	beq $0, $0, compare
