**AXI GPIO Counter on a Zynq-7000**

This project is designed to help me learn how to communicate between the PS and PL on a Cora Z7-07S SoC using AXI GPIO. 

It implements a simple button-controlled counter in the FPGA fabric, which sends its value back to the PS. The PS reads this value via AXI GPIO and maps it to the system’s LEDs.

