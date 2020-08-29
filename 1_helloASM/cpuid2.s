#cpuid2.s View the CPUID vendor ID string using C library calls
.section .data
output:
   .asciz "The processor Vendor ID is '%s'\s"
.section .bss
   .lcomm buffer, 12
.section .text
.globl _start
_start:
   movl $0, %eax
   cpuid
   movl $buffer, %edi
   movl %ebx, (%edi)
   movl %edx, 4(%edi)
   movl %ecx, 8(%edi)
   pushq $buffer
   pushq $output
   call printf
   addl $8, %esp
   pushq $0
   call exit
    
