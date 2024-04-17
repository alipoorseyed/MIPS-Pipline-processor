

module dataMem2 (clk, rst, writeEn, readEn, finaladdress, dataIn, dataOut);
  input clk, rst, readEn, writeEn;
  input [31:0] finaladdress, dataIn;
  output [31:0] dataOut;

  integer i;
  integer j;
  reg [7:0] dataMem [0:1023];
  
  always @ (posedge clk) begin
    if (rst)
	begin
      for (i = 0; i < 1024; i = i + 1)
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
      {dataMem[finaladdress], dataMem[finaladdress + 1], dataMem[finaladdress + 2], dataMem[finaladdress + 3]} <= dataIn;
	  end
	  if(dataIn==144)
	  begin
	  for(j = 0 ; j <=43  ; j=j+4)
	  begin
	  $display("dataMem[%0d] = %b" , j, {dataMem[j], dataMem[j + 1], dataMem[j + 2], dataMem[j + 3]});
	  end
	  end

  end

  assign dataOut = {dataMem[finaladdress], dataMem[finaladdress + 1], dataMem[finaladdress + 2], dataMem[finaladdress + 3]};
endmodule // dataMem2