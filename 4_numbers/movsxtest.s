# movstest.s - An example of the MOVSX instruction (move preserving the sign in this case -79 to eax is the same -79)
.section .text
.globl _start
	_start:
	   nop
	   movw $-79, %cx
	   movl $0, %ebx
	   movw %cx, %bx
	   movsx %cx, %eax
 	   movl $1, %eax
	   movl $0, %ebx
	   int $0x80
