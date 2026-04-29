MUHAMMET ENES BIÇAK - 2220357005
ELE432 - ADVANCED DIGITAL DESIGN
HOMEWORK 2 - MULTICYCLE RISCV PROCESSOR CONTROLLER
<img width="1909" height="575" alt="image" src="https://github.com/user-attachments/assets/83431967-2309-492a-a1af-2ff1e52bfdb9" />
<img width="1909" height="578" alt="image" src="https://github.com/user-attachments/assets/6f3286ea-d67e-425b-81ae-5936cef53055" />
<img width="954" height="152" alt="image" src="https://github.com/user-attachments/assets/0fa1b588-1cd2-4323-b693-8a741b160ad4" />

2 IMPORTANT DEBUG STEPS :

1)
I discovered a discrepancy between the assignment document and the provided controller.tv file. Table 1 in the assignment specified Add = 000 and Sub = 001. However, the test vector file expected the standard Harris & Harris textbook opcodes (Add = 010, Sub = 110, etc.).
Resolution: I updated the testvector file accordingly.

2)
The assignment explicitly instructed to set "don't care" outputs to 0 for deterministic behavior. The controller module correctly implemented this. However, the controller.tv file contained X for these don't care states. Since the provided testbench used the strict inequality operator (if (actual !== expected)), it flagged a mismatch every time the controller outputted a 0 instead of an X, causing false positive errors.
Resolution: I modified the evaluation logic in the testbench (line 49) by changing the strict inequality operator (!==) to the SystemVerilog wildcard inequality operator (!=?). This allowed the testbench to properly ignore the X (don't care) bits in the expected vector, resulting in a completely clean simulation with 0 errors.

