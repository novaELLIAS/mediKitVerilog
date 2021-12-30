
module freqDiv_1000(clk, clk_out);
   input     clk;
   output    clk_out;
   
   reg [8:0] tmp;
   reg       clktmp;
   
   always @(  clk)
      
      begin
         if (tmp == 499)
		 // 计数器达到50%高低电平转换点
         begin
            tmp <= 0;
            clktmp <= (~clktmp);
			// 输出时钟反相
         end
         else
            tmp <= tmp + 1;
      end
   assign clk_out = clktmp;
   
endmodule
