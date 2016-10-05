.data
msg1:	.asciiz " Enter a positive number: \n"
msg2:	.asciiz "The factorial is: "
.text
.globl main
.globl my_mul
main:
   addi $sp, $sp, -4	#make room for $ra on the stack
   sw $ra, 0($sp)	#push $ra
   la $a0, msg1		#Load address of msg1 into $a0
   jal user_prompt	#Display instruction user_prompt
   jal read_integer     #Read user input
   add $a0, $v0, $0	#input in $a0
   addi $a1, $a0, -1    #$a1 = n-1
   jal factorial	#Compute factorial
   add $t0, $v0, $0	
   la $a0, msg2		#Load address
   jal user_prompt	#Syscall for print_str
   add $a0, $t0, $0	
   li $v0, 1		#Syscall for print_int
   syscall		
   lw $ra, 0($sp)	#restore $ra
   addi $sp, $sp, 4	
   jr $ra		#return from main
user_prompt:
   addi $sp, $sp, -4    #make room
   sw $v0, 0($sp)      	#Store $v0 on stack
   li $v0, 4		#syscall for print_str
   syscall		
   lw $v0, 0($sp)       #Restore register $v0
   addi $sp, $sp, 4	
   jr $ra
read_integer:		#Function to read input integer
   li $v0, 5		#Syscall for read_integer
   syscall		
   jr $ra               
factorial:		#Factorial function
   beq $a1,$zero,finish 
   addiu $sp, $sp, -8	#make room
   sw $a1, 4($sp)       
   sw $ra, 0($sp)	
   jal my_mul		#Call multiply function
   add $a0, $v0, $0     
   lw $ra, 0($sp)	
   lw $a1, 4($sp)       
   addiu $sp, $sp,8 	
   addi $a1, $a1, -1     
   j factorial		#Back to factorial function
finish:
   jr $ra		
my_mul:			
   addi $sp, $sp, -4	
   sw $s0, 0($sp)	
   add $s0, $a1, $0	
   add $v0, $0, $0	 
mult_loop:
   beq $s0, $0, mult_eol 
   add $v0, $v0, $a0     
   addi $s0, $s0, -1    
   j mult_loop          
mult_eol:
   lw $s0, 0($sp)	
   addi $sp, $sp, 4	 
   jr $ra    		 