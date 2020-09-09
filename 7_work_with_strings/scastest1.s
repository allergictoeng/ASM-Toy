#scastest1.s - SCAS family of instructions is used to scan strings for one or more search characters
.section .data
string1:
   .ascii "This is a test - a long text string to scan."
length:
   .int 44
string:
   .ascii "-"
.section .text
.globl _start
    _start:
	nop
	leal string1, %edi
	leal string2, %esi
	movl length, %ecx
	lodsb
	cld
	repne scasb
	jne notfound
	subw length, %cx
	neg %cx
	movl $1, %eax
	movl %ecx, %ebx
	int $0x80
    notfound:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
