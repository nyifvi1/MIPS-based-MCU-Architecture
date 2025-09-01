# MCU Single-Cycle Project (Altera DE2-115, Cyclone IV FPGA)

This project features a complete MCU system built around a custom single-cycle CPU in VHDL, enhanced with peripheral integration and memory-mapped I/O support.

## Key Features

- Full MCU on FPGA built from a single-cycle CPU with memory-mapped I/O architecture.
- Integrated peripherals:
  - Programmable FIR filter optimized with stack-based buffering and dedicated clock domain for efficiency.
  - Hardware timer for timed events.
  - Interrupt controller supporting nested interrupt handling and ISR-based real-time responses.
- Custom memory-mapped interface for seamless communication between CPU and peripherals.
- Verified through RTL simulation using ModelSim and in-hardware testing via SignalTap.

## Project Structure

| Directory         | Description                                             |
|------------------|---------------------------------------------------------|
| `VHDL/`           | RTL sources for CPU and peripheral modules              |
| `TB/`             | Testbenches for unit and system validation              |
| `SIM/`            | Simulation scripts and waveform capture setups          |
| `OUTPUT_FILES/`   | Compiled artifacts including FPGA bitstream             |
| `SW QA/`          | MIPS assembly programs for functional QA                |
| `Memory_files/`   | ITCM and DTCM memory initialization files path          |

## Getting Started

1. Open the VHDL project in your FPGA toolchain (e.g., Quartus).
2. Compile to generate the `.sof` file.
3. Program the DE2-115 board with the compiled bitstream.
5. Use SignalTap with the configurations from `STP/` to monitor internal signals in real time.

## Tools Used

- VHDL for RTL implementation  
- ModelSim for functional and waveform simulation  
- Quartus Prime for synthesis, timing analysis, and bitstream generation  
- SignalTap Logic Analyzer for on-board hardware verification  
- Altera DE2-115 FPGA (Cyclone IV) for deployment and testing

