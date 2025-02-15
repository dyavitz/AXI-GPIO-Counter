# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\dyavi\workspace\ledcounter_system\_ide\scripts\2bitcntr_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\dyavi\workspace\ledcounter_system\_ide\scripts\2bitcntr_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370BD04D5A" && level==0 && jtag_device_ctx=="jsn-Cora Z7 - 7007S-210370BD04D5A-13723093-0"}
fpga -file C:/Users/dyavi/workspace/ledcounter/_ide/bitstream/AXIGPIOCOUNTER.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/dyavi/workspace/AXIGPIOCOUNTER/export/AXIGPIOCOUNTER/hw/AXIGPIOCOUNTER.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/dyavi/workspace/ledcounter/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/dyavi/workspace/ledcounter/Debug/ledcounter.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
