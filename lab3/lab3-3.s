.data
.globl main
my_array:	.space 40
.text
main:
addi $s0, $s0, 9		#j=9
addi $s2, $s2, 10		#10 is the value we will use to compare

la $t0, my_array

loop:
bge $s1, $s2, print		#if i >= 10, finish loop
sw $s0, 0($t0)			#my_array[i] = j
addi $s1, $s1, 1		#i++
addi $t0, $t0, 4		#i++
addi $s0, $s0, 1		#j++
j loop

finish:
jr $ra

print:
bge $t2, $s2, finish
li $v0, 1			#print_int
lw $a0, 0($t0)			#load int to be printed
syscall
addi $t2, $t2, 1		#i++
addi $t0, $t0, 4		#i++
