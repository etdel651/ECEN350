.text
    .globl main
    main:
    # replace X with any number you like
    addi $t0, $0, X
    # make sure you replace Z with the first digit of your UIN
    srl $t1,$t0, Z  	#computation 1, result is in $t1
    sll $t2,$t0, Z  	#computation 2, result is in $t2
    # check the content of $t1 and $t2
    jr $ra              # return from main; return address stored in $ra