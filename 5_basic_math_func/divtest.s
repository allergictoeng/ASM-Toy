#divtest.s - An example of the DIV instruction
.section .data
dividend:
     .quad 8335
divisor:
     .int 25
quocient:
     .int 0
remainder:
     .int 0
output:
     .asciz "The quotient is %d, and the remainder is %d\n"
.section .text
.globl _start
     _start:
	nop
	movl dividend, %eax
	movl dividend+4, %edx
	divl divisor
	movl %eax, quitient
	movl %edx, remainder
	pushl remainder
	pushl quitient
	pushl $output
	call printf
	add $12, %esp
	pushl $0
	call exit
