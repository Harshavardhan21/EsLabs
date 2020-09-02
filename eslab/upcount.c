#include<LPC17XX.h>
#include<stdio.h>
unsigned int j;
	unsigned long lcd=0x00000000;

int main(void){
LPC_PINCON->PINSEL0 &=0xFF0000FF;
	LPC_GPIO0->FIODIR |=0x0000FF0;
	
	while(1){
	for(lcd=255;lcd>0;lcd--){
	LPC_GPIO0->FIOPIN=lcd<<4;
	for(j=0;j<1000;j++);	
	}
		
		}
	
	}