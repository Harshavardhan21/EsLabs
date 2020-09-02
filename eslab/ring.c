#include<LPC17XX.h>
#include<stdio.h>
unsigned int j;
	unsigned long lcd=1;

int main(void){
LPC_PINCON->PINSEL0 &=0xFF0000FF;
	LPC_GPIO0->FIODIR |=0x0000FF0;
	
	while(1){
	if(lcd==0x00000800){lcd=1;}
	LPC_GPIO0->FIOPIN=lcd<<4;
		lcd<<=1;
		
	for(j=0;j<100000;j++);	
	
		
		}
	
	}