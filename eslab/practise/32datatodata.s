	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	area mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=SRC
	LDR R1,=DST
	LDR R2,[R0]
	STR R2,[R1]
STOP
		B STOP
SRC DCD 5;
		AREA mydata,DATA,READWRITE
DST DCD 0
		END