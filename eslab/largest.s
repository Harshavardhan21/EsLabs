	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY 
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM;
	LDR R8,=RESULT
	LDR R1,[R0]
	MOV R2,R1;
	ADD R0,#4
	MOV R5,#4
LOOP
	LDR R3,[R0]
	CMP R2,R3
	BGT	F
	MOV R2,R3
F
	ADD R0,#4
	SUB R5,#1
	CMP R5,#0
	BNE LOOP
	STR R2,[R8]
STOP
	B STOP
NUM DCD 0x2,0x3,0x12,0x8,0x9
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END