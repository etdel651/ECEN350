.text               # text section
    .globl main         # call main by MARS
    main:
    addi $t1, $0, 10	    # load immediate value (10) into $t1
    addi $t2, $0, 11	    # load immediate value (11) into $t2
    add $t3, $t1, $t2   # add two numbers into $t3
    jr $ra              # return from main; return address stored in $ra