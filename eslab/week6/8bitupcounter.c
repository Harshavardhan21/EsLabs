#include<stdio.h>
#include<LPC17xx.h>
int main(){
unsigned int i,j;
	unsigned int c=1;
	unsigned long led;
	LPC_PINCON->PINSEL0&=0xFF0000FF;
	LPC_GPIO0->FIODIR|=0x00000FF0;

	while(1){

		for( led=0;led<256;led++){
		LPC_GPIO0->FIOPIN=led<<4;
			for(j=0;j<1000;j++);
		
		}
	
	
	}
}