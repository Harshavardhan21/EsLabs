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
	LDR R1,[R0]
	LDR R2,=0X0F
	LDR R7,=RESULT
UP	AND R3,R1,R2
	LSR R1,#4
	ORR R3,R3,#0x30
	STR R3,[R7],#1
	CMP R1,#0
	BNE UP
	

STOP
	B STOP
NUM DCD 0X123456789
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END
	