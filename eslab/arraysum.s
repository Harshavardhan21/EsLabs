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
	LDR R0,=NUM
	
	LDR R9,=RESULT
	MOV R2,#10
	MOV R3,#0
LOOP
	LDR R1,[R0]
	ADD R3,R3,R1
	ADD R0,#4
	SUB R2,#1
	CMP R2,#0

	BNE LOOP
	STR R3,[R9]
STOP
	B STOP
NUM DCD 10,20,30,40,50,60,70,80,90,100
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END
	