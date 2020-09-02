		AREA RESET , DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10000000
	DCD Reset_Handler
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0,=num;
	ldr r3,=result
	ldrb r1,[r0]
	and r2,r1,#0X0F
	cmp r1,#9
	bls down
	add r1,#7
down
	add r2,#0x30
	strb r2,[r3]
	and r4,r1,#0xf0
	mov r4,r4,lsr #4
	cmp r4,#9
	ble down1
	add r3,#7
down1 
	add r4,#0x30
	strb r4,[r3,#1]
num dcd 0x000000055
		area mydata,data,readwrite
result dcd 0
		end
	
	
	
STOP
	B STOP
