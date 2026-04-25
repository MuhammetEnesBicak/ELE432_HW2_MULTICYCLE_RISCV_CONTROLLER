`timescale 1ns/1ps

module aludec(input  logic       opb5,
              input  logic [2:0] funct3,
              input  logic       funct7b5,
              input  logic [1:0] ALUOp,
              output logic [2:0] ALUControl);

  logic  RtypeSub;
  assign RtypeSub = funct7b5 & opb5;

  always_comb
    case(ALUOp)
      2'b00:                ALUControl = 3'b010; // Toplama (lw, sw vb.) - TV'ye göre
      2'b01:                ALUControl = 3'b110; // Çıkarma (beq) - TV'ye göre
      default: case(funct3)                      // R-type veya I-type ALU
                 3'b000:  if (RtypeSub)
                            ALUControl = 3'b110; // sub
                          else
                            ALUControl = 3'b010; // add, addi
                 3'b010:  ALUControl = 3'b111; // slt, slti
                 3'b110:  ALUControl = 3'b001; // or, ori
                 3'b111:  ALUControl = 3'b000; // and, andi
                 default: ALUControl = 3'b000; // Varsayılan
               endcase
    endcase
endmodule