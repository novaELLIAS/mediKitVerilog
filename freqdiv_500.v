//--------------------------------------------------------------------------------------------
//
// Generated by X-HDL VHDL Translator - Version 2.0.0 Feb. 1, 2011
// ?? 12? 27 2021 23:51:27
//
//      input file      : 
//      Component name  : freqdiv_500
//      Author          : 
//      Company         : 
//
//      Description     : 
//
//
//--------------------------------------------------------------------------------------------

module freqDiv_500(clk, clk_out);
   input     clk;
   output    clk_out;
   
   reg [7:0] tmp;
   reg       clktmp;
   
   always @(  clk)
      
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
