	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	dcd 0x10001000
	dcd Reset_Handler
	align 
	area mycode,code,readonly
	entry
	export Reset_Handler
Reset_Handler
	ldr r0,=src;
	ldr r7,=des
	mov r4,#10
loop	
	ldr r1,[r0]
	add r2,r2,r1
	add r0,#4
	sub r4,#1
	cmp r4,#0
	bne loop
	str r2,[r7]
here b here
src dcd 1,2,3,4,5,6,7,8,9,0
	area mydata,data,readwrite
des dcd 0
		end