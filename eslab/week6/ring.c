#include<stdio.h>
#include<LPC17xx.h>
int main(){

	unsigned long led=0x0000010;
	unsigned int i,j;
	LPC_PINCON->PINSEL0&=0xFF0000FF;
	LPC_GPIO0->FIODIR|=0x00000FF0;
	while(1){
	if(led==0x00000800){led=0x00000010;}
	LPC_GPIO0->FIOPIN=led;
	led<<=1;
	for(j=0;j<10000;j++);
	
	
	}


}