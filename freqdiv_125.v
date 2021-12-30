

module freqDiv_125(clk, clk_out);
   input     clk;
   output    clk_out;
   
   reg [5:0] tmp;
   reg       clktmp;
   
   always @(  clk)
      
      begin
         if (tmp == 62)
         begin
            tmp <= 0;
            clktmp <= (~clktmp);
         end
         else
            tmp <= tmp + 1;
      end
   assign clk_out = clktmp;
   
endmodule
