.data
msg1:	.word 0:24
.text
.globl main
main:
  addu $s0, $0,$ra	#save the return address
  li $v0, 8		#syscall for read_str
  la $a0, msg1		#load address of msg1 to store string
  li $a1, 100		#msg1 is 100 bytes
  add $t2, $0, $0
  syscall
compare:
  lb $t0, 0($a0)	#load the character into $t0
  li $t1, 'a'		#get value of 'a'
  blt $t0, $t1, noaddone #do nothing if letter is less than 'a'
  li $t1, 'z'		#get value of 'z'
  bgt $t0, $t1, noaddone #do nothing if letter is >'z'
  addi $t2, 1		#add 1 to count
  addi $a0, 1		#move to next character
  beq $0, $0, compare
noaddone:
  beq $t0, $0, endloop
  addi $a0, 1		#move to next character  
  beq $0, $0, compare
endloop:
  li $a0, 1
  add $a0, $0, $t2
  li $v0, 1
  syscall
  addu $ra, $s0, $0		#restore return address
  jr $ra
