`include "defines.v"

module MEM1Stage (clk, rst, MEM_R_EN, MEM_W_EN, ALU_res, ST_value, base_address);
  input clk, rst, MEM_R_EN, MEM_W_EN;
  input [`WORD_LEN-1:0] ALU_res, ST_value;
  output [`WORD_LEN-1:0]  base_address;

  dataMem dataMem (
    .address(ALU_res),
    .base_address(base_address)
  );
endmodule // MEM1Stage