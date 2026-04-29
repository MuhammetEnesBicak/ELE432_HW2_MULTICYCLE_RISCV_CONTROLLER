MUHAMMET ENES BIÇAK - 2220357005
ELE432 - ADVANCED DIGITAL DESIGN
HOMEWORK 2 - MULTICYCLE RISCV PROCESSOR CONTROLLER

SIMULATION WAVEFORMS:
From 0 to 220ns :
<img width="1475" height="431" alt="image" src="https://github.com/user-attachments/assets/c8f1acfe-1065-4cb7-bed8-4d64b67228f1" />
220 to 420 ns :
<img width="1852" height="548" alt="hw2graph2" src="https://github.com/user-attachments/assets/539504d5-fbc5-406e-bf21-2158566fd5c4" />










SIMULATION SUCCEEDED :
<img width="954" height="152" alt="image" src="https://github.com/user-attachments/assets/0fa1b588-1cd2-4323-b693-8a741b160ad4" />

2 IMPORTANT DEBUG STEPS :

1)
I discovered a discrepancy between the assignment document and the provided controller.tv file. Table 1 in the assignment specified Add = 000 and Sub = 001. However, the test vector file expected the standard Harris & Harris textbook opcodes (Add = 010, Sub = 110, etc.).
Resolution: I updated the testvector file accordingly.

2)
The assignment explicitly instructed to set "don't care" outputs to 0 for deterministic behavior. The controller module correctly implemented this. However, the controller.tv file contained X for these don't care states. Since the provided testbench used the strict inequality operator (if (actual !== expected)), it flagged a mismatch every time the controller outputted a 0 instead of an X, causing false positive errors.
Resolution: I modified the evaluation logic in the testbench (line 49) by changing the strict inequality operator (!==) to the SystemVerilog wildcard inequality operator (!=?). This allowed the testbench to properly ignore the X (don't care) bits in the expected vector, resulting in a completely clean simulation with 0 errors.

