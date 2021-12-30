
module buzzerDriver(clk_base, clk_ctr, state_in, buzz_out);
   input       clk_base;
   input       clk_ctr;
   input [3:0] state_in;
   output      buzz_out;
   reg         buzz_out;
   
   reg [0:0]   count;
   reg         buz0;
   
   always @(  clk_ctr)
   // 产生蜂鸣器两种发声频率切换的控制信号
   
   begin: p1
      
      begin
         if (count == 1)
            count <= 0;
         else
            count <= count + 1;
      end
   end
   
   
   always @(  clk_base)
   // 2分频
   begin: p2
      reg [0:0]   c1;
      
      begin
         if (c1 == 1)
         begin
            buz0 <= (~buz0);
            c1 = 0;
         end
         else
            c1 = c1 + 1;
      end
   end
   
   
   always @(state_in)
   // 药盒提醒服药状态下蜂鸣器发声，两个发声频率下切换
   begin: p3
      if (state_in == 4'b0110 | state_in == 4'b0111 | state_in == 4'b1000)
         case (count)
            0 :
               buzz_out <= clk_base;
            1 :
               buzz_out <= buz0;
            default :
               ;
         endcase
      else
         buzz_out <= 1'b0;
   end
   
endmodule
