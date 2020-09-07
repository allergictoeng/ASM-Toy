#fpmath1.s - An example of basic FPU math
#####################################################################################################
#((43.65 / 22) + (76.34 * 3.1)) / ((12.43 * 6) – (140.2 / 94.21))
# 
#1-Load 43.65 into ST0 .
#2-Divide ST0 by 22, saving the results in ST0.
#3-Load 76.34 in ST0 (the answer from step 2 moves to ST1 ).
#4-Load 3.1 in ST0 (the value in step 3 moves to ST1 , and the answer from Step 2 moves to ST2 ).
#5-Multiply ST0 and ST1 , leaving the answer in ST0 .
#6-Add ST0 and ST2 , leaving the answer in ST0 (this is the left side of the equation).
#7-Load 12.43 into ST0 (the answer from Step 6 moves to ST1 ).
#8-Multiply ST0 by 6, leaving the answer in ST0 .
#9-Load 140.2 into ST0 (the answer from Step 8 moves to ST1 , and from Step 6 to ST2 ).
#10-Load 94.21 into ST0 (the answer from Step 8 moves to ST2 , and from Step 6 to ST3 ).
#11-Divide ST1 by ST0 , popping the stack and saving the results in ST0 (the answer from Step 8
#12-moves to ST1 , and from Step 6 to ST2 ).
#13-Subtract ST0 from ST1 , storing the result in ST0 (this is the right side of the equation).
#14-Divide ST2 by ST0 , storing the result in ST0 (this is the final answer).
######################################################################################################
.section .data
value1:
   .float 43.65
value2:
   .int 22
value3:
   .float 76.34
value4:
   .float 3.1
value5:
   .float 12.43
value6:
   .int 6
value7:
   .float 140.2
value8:
   .float 94.21
output:
   .asciz "The result is %f\n"
.section .text
.globl _start
    _start:
	nop
	finit
	flds value1	
	fidiv value2
	flds value3
	flds value4
	fmul %st(1), %st(0)
	fadd %st(2), %st(0)
	flds value5
	fimul value6
	flds value7
	flds value8
	fdivrp
	fsubr %st(1), %st(0)
	fdivr %st(2), %st(0)
	subl $8, %esp
	fstpl (%esp)
	pushl $output
	call printf
	add $12, %esp
	pushl $0
	call exit
