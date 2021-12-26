
module keyInput(clk, clkt, btn0, btn1, btn2, btn3, btn4, btn5, btn6, bout0, bout1, bout2, bout3, bout4, bout5, bout6);
   input   clk;
   input   clkt;
   input   btn0;
   input   btn1;
   input   btn2;
   input   btn3;
   input   btn4;
   input   btn5;
   input   btn6;
   output  bout0;
   output  bout1;
   output  bout2;
   output  bout3;
   output  bout4;
   output  bout5;
   output  bout6;
   
   reg     resetmp1;
   reg     resetmp2;
   reg     resetmp3;
   reg     resetmp4;
   reg     resetmp5;
   reg     resetmp6;
   reg     resetmp7;
   reg     resetmp8;
   reg     resetmp9;
   reg     resetmp10;
   reg     resetmp11;
   reg     resetmp12;
   reg     resetmp13;
   reg     resetmp14;
   
   always @(negedge clk)
      
      begin
         resetmp2 <= resetmp1;
         
         resetmp4 <= resetmp3;
         
         resetmp6 <= resetmp5;
         
         resetmp8 <= resetmp7;
         
         resetmp10 <= resetmp9;
         
         resetmp12 <= resetmp11;
         
         resetmp14 <= resetmp13;
      end
   
   
   always @(negedge clkt)
      
      begin
         resetmp1 <= btn0;
         resetmp3 <= btn1;
         resetmp5 <= btn2;
         resetmp7 <= btn3;
         resetmp9 <= btn4;
         resetmp11 <= btn5;
         resetmp13 <= btn6;
      end
   assign bout0 = clk & resetmp1 & ((~resetmp2));
   assign bout1 = clk & resetmp3 & ((~resetmp4));
   assign bout2 = clk & resetmp5 & ((~resetmp6));
   assign bout3 = clk & resetmp7 & ((~resetmp8));
   assign bout4 = clk & resetmp9 & ((~resetmp10));
   assign bout5 = clk & resetmp11 & ((~resetmp12));
   assign bout6 = clk & resetmp13 & ((~resetmp14));
   
endmodule