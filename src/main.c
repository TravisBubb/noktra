#include "stm32f4xx.h"
#include <stdint.h>

void delay(volatile uint32_t count) {
  while (count--) {
    __asm__("nop");
  }
}

int main(void) {
  // Enable GPIOA clock (assuming onboard LED is on PA5)
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;

  // Set PA5 as output (MODER5 = 01)
  GPIOA->MODER &= ~(0x3 << (5 * 2));
  GPIOA->MODER |= (0x1 << (5 * 2));

  while (1) {
    // Toggle PA5
    GPIOA->ODR ^= (1 << 5);

    delay(1000000);
  }
}
