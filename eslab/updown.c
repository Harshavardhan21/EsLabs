#include<LPC17XX.h>
#include<stdio.h>
unsigned int j;
	unsigned long lcd=0x00000000;

int main(void){
LPC_PINCON->PINSEL0 &=0xFF0000FF;
	LPC_GPIO0->FIODIR |=0x0000FF0;
	LPC_PINCON->PINSEL2 &=0xFCFFFFFF;
	LPC_GPIO2->FIODIR &=0xFFFFEFFF;
	while(1){
		if(LPC_GPIO2->FIOPIN&1<<12){
	for(lcd=255;lcd>0;lcd--){
	LPC_GPIO0->FIOPIN=lcd<<4;

		for(j=0;j<1000;j++);	
	}}
		else{
		for(lcd=0;lcd<256;lcd++){
	LPC_GPIO0->FIOPIN=lcd<<4;
	for(j=0;j<10000;j++);	
	}
		
		}
		
		}
	
	}