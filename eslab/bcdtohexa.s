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
	LDR R0,=SRC
	LDR R1,=DES
	LDR R2,[R0]
	MOV R3,#10
	MOV R4,#0XF
	MOV R6,#0
	MOV R9,#1
LOOP
	AND R5,R2,R4
	MLA R6,R5,R9,R6
	MUL R9,R3
	LSR R2,#4
	CMP R2,#0
	BNE LOOP
	STR R6,[R1]
STOP B STOP
SRC DCD 0X12345678
	
	AREA mydata,DATA,READWRITE
DES DCD 0
	END
		
	