#include <LPC17xx.h>

#define PRESCALE (25000-1) //25000 PCLK clock cycles to increment TC by 1 
#define	FIRST_SEG 0xF87FFFFF
#define SECOND_SEG 0xF8FFFFFF
#define THIRD_SEG 0xF97FFFFF
#define FOURTH_SEG 0xF9FFFFFF
#define DISABLE_ALL 0xFA7FFFFF

void delayMS(unsigned int milliseconds);
void initTimer0(void);

// 0  1  2  3   4  5  6
// O, N, L, II, t, E, S,
unsigned int lookup = {0x3F, 0x37, 0x38, 0x36, 0x78, 0x79, 0x6D};
int pattern = 0; // 0 = OnLII, 1 = tESt

void display(int pattern)
{
	// disable all segments
	LPC_GPIO0->FIOCLR = 0x00000FF0;
	LPC_GPIO1->FIOPIN = DISABLE_ALL;
	
	// OnLII
	if (pattern = 0)
	{
		// II
		LPC_GPIO1->FIOPIN = FIRST_SEG;
		LPC_GPIO0->FIOPIN = lookup[3];

		// L
		LPC_GPIO1->FIOPIN = SECOND_SEG;
		LPC_GPIO0->FIOPIN = lookup[2];

		// N
		LPC_GPIO1->FIOPIN = THIRD_SEG;
		LPC_GPIO0->FIOPIN = lookup[1];

		// O
		LPC_GPIO1->FIOPIN = FOURTH_SEG;
		LPC_GPIO0->FIOPIN = lookup[0];
	}
	else // tESt
	{
		// t
		LPC_GPIO1->FIOPIN = FIRST_SEG;
		LPC_GPIO0->FIOPIN = lookup[4];

		// S
		LPC_GPIO1->FIOPIN = SECOND_SEG;
		LPC_GPIO0->FIOPIN = lookup[6];

		// E
		LPC_GPIO1->FIOPIN = THIRD_SEG;
		LPC_GPIO0->FIOPIN = lookup[5];

		// t
		LPC_GPIO1->FIOPIN = FOURTH_SEG;
		LPC_GPIO0->FIOPIN = lookup[4];

	}
}

int main()
{
	// seven segment init
	LPC_PINCON->PINSEL0 &= 0xFF0000FF; // p0.4 to p0.11 // gpio data lines
	LPC_PINCON->PINSEL3 &= 0xFFC03FFF; // p1.23 to p1.26 // gpio enable lines
	LPC_GPIO0->FIODIR = 0xFF << 4; // p0.4 to p0.11 output
	LPC_GPIO1->FIODIR = 0xF << 23; // p1.23 to p1.26 output

	// Initialize Timer0
	initTimer0();

	while (1)
	{
		// ONLII
		display(0);

		delayMS(1000); //0.5 Second(s) Delay

		// tESt
		display(1);

		delayMS(1000); //0.5 Second(s) Delay
	}

}

void initTimer0(void)
{
	/Assuming that PLL0 has been setup with CCLK = 100Mhz and PCLK = 25Mhz./
	LPC_SC->PCONP |= (1 << 1); //Power up TIM0. By default TIM0 and TIM1 are enabled.
	LPC_SC->PCLKSEL0 &= ~(0x3 << 3); //Set PCLK for timer = CCLK/4 = 100/4 (default)

	LPC_TIM0->CTCR = 0x0;
	LPC_TIM0->PR = PRESCALE; //Increment LPC_TIM0->TC at every 24999+1 clock cycles
	//25000 clock cycles @25Mhz = 1 mS

	LPC_TIM0->TCR = 0x02; //Reset Timer
}

void delayMS(unsigned int milliseconds) //Using Timer0
{
	LPC_TIM0->TCR = 0x02; //Reset Timer
	LPC_TIM0->TCR = 0x01; //Enable timer

	while (LPC_TIM0->TC < milliseconds); //wait until timer counter reaches the desired delay

	LPC_TIM0->TCR = 0x00; //Disable timer
}