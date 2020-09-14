; Name : Ismael Rekik	
; ID : 40132567
; Class : Section U

section .data
; This block will contain the elements that will be used to do the division
	dividend: db 15d
	divisor: db 4d 
	counter: db 0d ; counts the number of time the loop executes
	remainder: db  0d ; dividend of the answer
	quotient: db 0d ; integer part of the answer 
	null: db 0d ; label to compare to 0 when the substraction will result in a negative answer
section .text
	global _start

; start block : includes the initialization of the registers
_start:
	xor eax,eax ; clear all the registers
	xor ebx,ebx
	xor ecx,ecx
	xor edx,edx
	mov al,[dividend] ; initilization of all the registers with the initial values
	mov bl,[divisor]
	mov cl,[counter]
	mov dl,[null]
; loop block that will increment the counter every time the loop is executed and remove from the dividend the value of the divisor
_loop:
	inc ecx  ;increment the loop counter by one each time the loop is executed
	sub eax,ebx ; substract the dividend by the divisor	
	cmp eax,edx ; condition that will allow the program to redo the loop as long as the dividend is positive
	jge _loop
; endloop block accessible when the loop ends. 
_endloop:
	add eax,ebx ; code that will go back from 1 loop to have a positive answer for the dividend
	dec ecx ; decrease the loop counter by 1 because the counter will have be incremented even when the condition will not be met
; end block that will execute after the endloop block
_end:
	mov [quotient],ecx ; gives the value of the decreased counter to the quotient
	mov [remainder],eax ; gives the value of the final dividend to the reminder
	mov eax,1
	mov ebx,0
	int 80h
;end of the program
