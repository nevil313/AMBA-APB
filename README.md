# AMBA APB Protocol Implementation in Verilog

This repository contains a Verilog-based implementation and simulation of the AMBA APB (Advanced Microcontroller Bus Architecture - Advanced Peripheral Bus) protocol. The APB protocol is commonly used in SoC (System on Chip) designs for connecting low-speed peripherals to the system bus.

---

## 📌 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Protocol Description](#protocol-description)
- [Simulation Setup](#simulation-setup)
- [Tools Used](#tools-used)
- [License](#license)

---

## ✅ Overview

This project showcases a basic RTL design of the AMBA APB protocol using Verilog. It includes the implementation of APB Master, Slave, and an interface module, along with a testbench to verify the protocol operation through simulation.

---

## ✨ Features

- Verilog RTL design following APB specification
- Modular and scalable code structure
- Read and write operations with signal timing compliance
- Ready-to-run testbench
- Easily understandable for students and beginners

---



## 📘 Protocol Description

The AMBA APB protocol includes the following primary signals:

- `PCLK` : Clock signal
- `PRESETn` : Active-low reset
- `PADDR` : Address bus
- `PWDATA` : Write data bus
- `PRDATA` : Read data bus
- `PWRITE` : Write/read control
- `PSEL` : Slave select
- `PENABLE` : Enable signal for data transfer phase
- `PREADY` : Slave ready signal
- `PSLVERR` : Error signal (optional)

### APB Transfer Phases:
1. **Setup Phase**: Master drives `PADDR`, `PWDATA`, `PWRITE`, `PSEL=1`, and `PENABLE=0`
2. **Enable Phase**: Master sets `PENABLE=1` and waits for `PREADY=1` from the slave
3. **Completion**: Slave responds with `PRDATA` for read or accepts `PWDATA` for write

---

## ⚙️ Simulation Setup

To run the simulation:

1. Clone this repository:
```bash
git clone https://github.com/nevil313/AMBA-APB.git
cd AMBA-APB

---




