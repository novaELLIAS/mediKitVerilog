
module LCDdecoder(datain, dataout);
   input [6:0]  datain; // 各个计数模块的输出信号作为输入
   output [7:0] dataout; //译码之后的信号作为输出
   
   reg [7:0]    dis;
   
   always @(datain)
      case (datain)
         7'b1111110 :
            dis <= 8'b00110000;
         7'b0110000 :
            dis <= 8'b00110001;
         7'b1101101 :
            dis <= 8'b00110010;
         7'b1111001 :
            dis <= 8'b00110011;
         7'b0110011 :
            dis <= 8'b00110100;
         7'b1011011 :
            dis <= 8'b00110101;
         7'b1011111 :
            dis <= 8'b00110110;
         7'b1110000 :
            dis <= 8'b00110111;
         7'b1111111 :
            dis <= 8'b00111000;
         7'b1111011 :
            dis <= 8'b00111001;
         default :
            dis <= 8'b00100000;
      endcase
   
   assign dataout = dis;
   
endmodule
