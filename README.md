#AMBA APB Protocol Implementation in Verilog:

Welcome to the AMBA APB (Advanced Microcontroller Bus Architecture - Advanced Peripheral Bus) Protocol implementation! This repository contains a Verilog-based simulation of the AMBA APB protocol, commonly used in SoC (System on Chip) designs for connecting low-speed peripherals.

##**✅ Overview**
This project showcases the Verilog RTL design and simulation of the AMBA APB protocol. The APB is part of the AMBA family developed by ARM, designed for low-power peripherals with a simple interface. It is widely used in embedded and ASIC designs.

The design includes:

APB Master

APB Slave

Bus Interface

**✨ Features**
Modular and scalable Verilog implementation

Fully functional APB master-slave communication

Protocol-compliant read and write operations

Easy-to-understand and modify for academic or industrial purposes

**📘 Protocol Description**
The APB Protocol includes the following signals:

PCLK: Clock signal

PRESETn: Active-low reset

PSEL: Select signal from the decoder

PENABLE: Indicates second and subsequent cycles of an APB transfer

PWRITE: Read/write control

PADDR: Address bus

PWDATA: Write data bus

PRDATA: Read data bus

PREADY: Ready signal from the slave

PSLVERR: Error signal from the slave

The typical transfer involves:

Setup Phase (Address and control phase)

Enable Phase (Data transfer and response)
