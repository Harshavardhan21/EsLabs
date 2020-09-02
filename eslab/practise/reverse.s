	AREA RESET,DATA,READONLY
		EXPORT __Vectors
__Vectors
	DCD 0X10001000
		DCD Reset_Handler
		align
		area mycode,code,readonly
		entry
		export Reset_Handler
Reset_Handler
		ldr r0,=src
		add r3,r0,#36
		
		mov r4,#5
loop	
		
		ldr r6,[r3]
		ldr r7,[r0]
		
		str r6,[r0]
		str r7,[r3]
		add r0,#4
		sub r3,#4
		sub r4,#1
		cmp r4,#0
		bne loop
		
		
stop
	b stop

	AREA mydata,DATA,READWRITE
src dcd 1,2,3,4,5,6,7,8,9,0
	
		end
		
				