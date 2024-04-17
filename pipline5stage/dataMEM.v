`include "defines.v"

module dataMem (clk, rst, writeEn, readEn, address, dataIn, dataOut);
  input clk, rst, readEn, writeEn;
  input [`WORD_LEN-1:0] address, dataIn;
  output [`WORD_LEN-1:0] dataOut;

  integer i;
  integer j;
  reg [`MEM_CELL_SIZE-1:0] dataMem [0:`DATA_MEM_SIZE-1];
  wire [`WORD_LEN-1:0] base_address;
  
  always @ (posedge clk) begin
    if (rst)
	begin
      for (i = 0; i < `DATA_MEM_SIZE; i = i + 1)
	     begin
		 if(i==3 || i==7)
		 begin
		 dataMem[i]<=1;
		 end
		 else
		 begin
           dataMem[i] <= 0;
		   end
		 end
		end
    else if (writeEn)
	begin
      {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]} <= dataIn;
	  end
	  if(dataIn==144)
	  begin
	  for(j = 0 ; j <=43  ; j=j+4)
	  begin
	  $display("dataMem[%0d] = %b" , j, {dataMem[j], dataMem[j + 1], dataMem[j + 2], dataMem[j + 3]});
	  end
	  end

  end

  assign base_address = (address >> 2) << 2;
  assign dataOut = {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]};
endmodule // dataMem