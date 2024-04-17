

module MEM2Stage (clk, rst, MEM_R_EN, MEM_W_EN, finaladdress, ST_value, dataMem_out);
  input clk, rst, MEM_R_EN, MEM_W_EN;
  input [31:0] finaladdress, ST_value;
  output [31:0]  dataMem_out;

  dataMem2 dataMem (
    .clk(clk),
    .rst(rst),
    .writeEn(MEM_W_EN),
    .readEn(MEM_R_EN),
    .finaladdress(finaladdress),
    .dataIn(ST_value),
    .dataOut(dataMem_out)
  );
endmodule // MEMStage


