`include "defines.v"

module instructionMem (rst, addr, instruction);
  input rst;
  input [`WORD_LEN-1:0] addr;
  output [`WORD_LEN-1:0] instruction;

  wire [$clog2(`INSTR_MEM_SIZE)-1:0] address = addr[$clog2(`INSTR_MEM_SIZE)-1:0];
  reg [`MEM_CELL_SIZE-1:0] instMem [0:`INSTR_MEM_SIZE-1];

  always @ (*) begin
  	if (rst) begin
        // No nop added in between instructions since there is a hazard detection unit
		
		
		
		instMem[0] <= 8'b10000000; //-- Addi	r5,r0,8
        instMem[1] <= 8'b10100000;
        instMem[2] <= 8'b00000000;
        instMem[3] <= 8'b00001000;
		
		
		
		instMem[4] <= 8'b10010000; //-- lw	r1,r0,0
        instMem[5] <= 8'b00100000;
        instMem[6] <= 8'b00000000;
        instMem[7] <= 8'b00000000;
		
		
		
		instMem[8] <= 8'b10010000; //-- lw	r2,r0,4
        instMem[9] <= 8'b01000000;
        instMem[10] <= 8'b00000000;
        instMem[11] <= 8'b00000100;
		
		
		
		instMem[12] <= 8'b10000000; //-- Addi	r4,r0,144
        instMem[13] <= 8'b10000000;
        instMem[14] <= 8'b00000000;
        instMem[15] <= 8'b10010000;
		
		
		
		instMem[16] <= 8'b00000100; //-- Add 	r3,r2,r1
        instMem[17] <= 8'b01100010;
        instMem[18] <= 8'b00001000;
        instMem[19] <= 8'b00000000;
		
		
		instMem[20] <= 8'b10100100; //-- BEQ	r4,r3,+6
        instMem[21] <= 8'b10000011;
        instMem[22] <= 8'b00000000;
        instMem[23] <= 8'b00000110;
		
		
		instMem[24] <= 8'b10010100; //-- sw	r3,r5,0
        instMem[25] <= 8'b01100101;
        instMem[26] <= 8'b00000000;
        instMem[27] <= 8'b00000000;
		
		
		
		instMem[28] <= 8'b10000000; //-- Addi	r5,r5,4
        instMem[29] <= 8'b10100101;
        instMem[30] <= 8'b00000000;
        instMem[31] <= 8'b00000100;
		
		
		
		instMem[32] <= 8'b10000000; //-- Addi	r1,r2,0
        instMem[33] <= 8'b00100010;
        instMem[34] <= 8'b00000000;
        instMem[35] <= 8'b00000000;
		
		
		
		instMem[36] <= 8'b10000000; //-- Addi	r2,r3,0
        instMem[37] <= 8'b01000011;
        instMem[38] <= 8'b00000000;
        instMem[39] <= 8'b00000000;
		
		
		
		instMem[40] <= 8'b10101000; //-- JMP 	-7
        instMem[41] <= 8'b00000000;
        instMem[42] <= 8'b11111111;
        instMem[43] <= 8'b11111001;
		
		
		
		instMem[44] <= 8'b00000000; //-- NOPE
        instMem[45] <= 8'b00000000;
        instMem[46] <= 8'b00000000;
        instMem[47] <= 8'b00000000;
		
		
      end
    end

  assign instruction = {instMem[address], instMem[address + 1], instMem[address + 2], instMem[address + 3]};
endmodule // insttructionMem
