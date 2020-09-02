#include<stdio.h>
#include<LPC17xx.h>
int main(){
unsigned int i,j;
	unsigned int led;
	LPC_PINCON->PINSEL0&=0xFF0000FF;
	LPC_GPIO0->FIODIR|=0x00000FF0;
		LPC_PINCON->PINSEL2&=0xFCFFFFFF;
	LPC_GPIO2->FIODIR&=0xFFFFEFFF;
	while(1){
	if(LPC_GPIO2->FIOPIN&1<<12){
	for(led=255;led>=0;led--){
	LPC_GPIO0->FIOSET=led<<4;
		for(j=0;j<1000;j++);
	
	}
	
	}else{
	for(led=0;led<256;led++){
	LPC_GPIO0->FIOSET=led<<4;
		for(j=0;j<1000;j++);
	
	
	
	}
	
	
	}
	
	


}}