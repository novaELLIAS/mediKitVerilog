
module freqDiv_1000(clk, clk_out);
   input     clk;
   output    clk_out;
   
   reg [8:0] tmp;
   reg       clktmp;
   
   always @(posedge clk)
      
      begin
         if (tmp == 499)
         begin
            tmp <= 0;
            clktmp <= (~clktmp);
         end
         else
            tmp <= tmp + 1;
      end
   assign clk_out = clktmp;
   
endmodule
