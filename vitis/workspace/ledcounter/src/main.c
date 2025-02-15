#include "xgpio.h"
#include "xparameters.h"
#include "sleep.h"

#define LED_GPIO_ID    XPAR_AXI_GPIO_0_DEVICE_ID
#define BTN_GPIO_ID    XPAR_AXI_GPIO_1_DEVICE_ID
#define BTN_OUT_GPIO_ID XPAR_AXI_GPIO_2_DEVICE_ID
#define COUNTER_GPIO_ID XPAR_AXI_GPIO_3_DEVICE_ID

XGpio GpioBtns;
XGpio GpioBtnOut;
XGpio GpioCounter;
XGpio GpioLeds;

int main() {
    int Status;
    u32 btn_value, counter_value;

    Status = XGpio_Initialize(&GpioBtns, BTN_GPIO_ID);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioBtns, 1, 0xFF);

    Status = XGpio_Initialize(&GpioBtnOut, BTN_OUT_GPIO_ID);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioBtnOut, 1, 0x00);

    Status = XGpio_Initialize(&GpioCounter, COUNTER_GPIO_ID);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioCounter, 1, 0xFF);

    Status = XGpio_Initialize(&GpioLeds, LED_GPIO_ID);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioLeds, 1, 0x00);

    while (1) { //will update to use interrupts
        btn_value = XGpio_DiscreteRead(&GpioBtns, 1);
        XGpio_DiscreteWrite(&GpioBtnOut, 1, btn_value);
        counter_value = XGpio_DiscreteRead(&GpioCounter, 1);
        XGpio_DiscreteWrite(&GpioLeds, 1, counter_value);
        usleep(2000);
    }
    return 0;
}
