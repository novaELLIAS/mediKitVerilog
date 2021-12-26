
module freqDiv_500(clk, clk_out);
   input     clk;
   output    clk_out;
   
   reg [7:0] tmp;
   reg       clktmp;
   
   always @(posedge clk)
      
      begin
         if (tmp == 249)
         begin
            tmp <= 0;
            clktmp <= (~clktmp);
         end
         else
            tmp <= tmp + 1;
      end
   assign clk_out = clktmp;
   
endmodule
