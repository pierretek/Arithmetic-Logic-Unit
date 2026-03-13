# Arithmetic Logic Unit &nbsp; <img src="https://github.com/user-attachments/assets/52a60221-cf09-4f87-b8fd-c5ce991e7918" width="40" height="40" align="top" />

An ALU architecture designed to perform various operations on two 8-bit inputs according to an opcode
 
## Details 
- The full Quartus project is in `Quartus Project/`, while the indiviudal VHDL components are in `Components/`.
- This project was created in `Quartus II 13.0sp1` using mainly VHDL, and implemented into an FPGA board *(Cyclone- II EP2C35F672C6 FPGA)*
- Each component was individually designed with VHDL, then the full architecture was wired together using block diagrams


## Architecture 

This design is comprised of several key components:

- Two **8-bit D-latches** (for storing inputs)
- A **4:16 decoder**
- A **Finite State Machine** (FSM)
- The **Arithmetic Logic Unit** (ALU)
- Two **seven-segment display drivers**

## Block Diagram
<p align="center">
  <img width="1000" alt="block-diagram" src="https://github.com/user-attachments/assets/af8d4d80-52f7-4447-8d0f-0bb8f27100db" />
</p>

---
_thanks for reading_


