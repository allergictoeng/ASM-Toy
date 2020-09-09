#convert.s - An converting lower to upper case
.section .data
string1: 
   .asciz "This is a TEST, of the conversion program!\n"
lenght:
   .int 43
.section .text
.globl _start
     _start:
	nop
	leal string, %esi
	movl %esi, %edi
	movl length, %ecx
	cld
     _loop1:
	lodsb
	cmpb $'a', %al
	jl skip
	cmpb $'z', %al
	jg skip
	subb $0x20, %al
     skip:
	stosb
	loop loop1
     end:
	pushl $string
	call printf
	addl $4, %esp
	pushl $0
	call exit
