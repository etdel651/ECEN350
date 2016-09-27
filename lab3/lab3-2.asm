.data
UIN: .word 0x28
.text
.globl main


main:
      add $s0, $0, $0                 	#initialize i=0
      addi $s1, $s1, 10			#store 10 in order to compare the values later on
      la $s2, UIN			#load address of UIN into register $s2
loop:
      bge $s0, $s1, finish		#if (i>=10) end the loop
      lw $t0, 0($s2)			#load into $t0
      addi $t0, $t0, -1			#uin-1
      sw $t0, 0($s2)	
      addi $s0, $s0, 1			#i++, counter
      j loop
finish:
      lw $v0, 0($s2)			#load UIN into the return value
      jr $ra				#return from main
