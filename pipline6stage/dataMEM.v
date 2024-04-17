`include "defines.v"

module dataMem (address, base_address);
  input [`WORD_LEN-1:0] address;
  output [`WORD_LEN-1:0] base_address;
  assign base_address = (address >> 2) << 2;
endmodule // dataMem
