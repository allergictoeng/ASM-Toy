# loop.s - An Example of the loop instruction
.section .data
output:
	.asciz "The Value is: %d\n"
.section .text
.globl _start
	_start:
	   movl $100, %ecx
	   movl $0, %eax
	loop:
	   addl %ecx, %eax
	   loop loop1
	   pushl %eax
	   pushl $output
	   call printf
	   add $8, %esp	
	   movl $1, %eax
	   movl $0, %ebx
	   int 0x80

