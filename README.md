MUHAMMET ENES BIÇAK - 2220357005
ELE432 - ADVANCED DIGITAL DESIGN
HOMEWORK 2 - MULTICYCLE RISCV PROCESSOR CONTROLLER

SIMULATION WAVEFORMS:
From 0 to 160ns :
<img width="1871" height="523" alt="image" src="https://github.com/user-attachments/assets/006deaa3-e0b5-4a2c-9b0c-b9337cd51794" />
160 to 320 ns :
<img width="1872" height="503" alt="image" src="https://github.com/user-attachments/assets/1d02d314-7c94-48b8-a75a-59d4e136f43f" />
320 to 420 ns :
<img width="1869" height="523" alt="image" src="https://github.com/user-attachments/assets/ca6f189a-3c2f-4c0b-926a-1a690b142807" />



SIMULATION SUCCEEDED :
<img width="954" height="152" alt="image" src="https://github.com/user-attachments/assets/0fa1b588-1cd2-4323-b693-8a741b160ad4" />

2 IMPORTANT DEBUG STEPS :

1)
I discovered a discrepancy between the assignment document and the provided controller.tv file. Table 1 in the assignment specified Add = 000 and Sub = 001. However, the test vector file expected the standard Harris & Harris textbook opcodes (Add = 010, Sub = 110, etc.).
Resolution: I updated the testvector file accordingly.

2)
The assignment explicitly instructed to set "don't care" outputs to 0 for deterministic behavior. The controller module correctly implemented this. However, the controller.tv file contained X for these don't care states. Since the provided testbench used the strict inequality operator (if (actual !== expected)), it flagged a mismatch every time the controller outputted a 0 instead of an X, causing false positive errors.
Resolution: I modified the evaluation logic in the testbench (line 49) by changing the strict inequality operator (!==) to the SystemVerilog wildcard inequality operator (!=?). This allowed the testbench to properly ignore the X (don't care) bits in the expected vector, resulting in a completely clean simulation with 0 errors.

