
module LEDdriver(clk, sta, led);
   input            clk;
   input [3:0]      sta;
   output [15:0]    led;
   reg [15:0]       led;
   
   parameter [3:0]  all_state_s0 = 0,
                    all_state_s1 = 1,
                    all_state_s2 = 2,
                    all_state_s3 = 3,
                    all_state_s4 = 4,
                    all_state_s5 = 5,
                    all_state_s6 = 6,
                    all_state_s7 = 7,
                    all_state_s8 = 8,
                    all_state_s9 = 9,
                    all_state_s10 = 10,
                    all_state_s11 = 11,
                    all_state_s12 = 12,
                    all_state_s13 = 13,
                    all_state_s14 = 14,
                    all_state_s15 = 15;
   wire             cnt;
   reg              flag;
   reg [3:0]        state;
   
   always @(  clk)
      
      begin
         
         if (sta == 4'b0110 | sta == 4'b0111 | sta == 4'b1000)
            flag <= 1'b1;
         else
            flag <= 1'b0;
         
         if (flag == 1'b0)
		 // 控制信号为0时禁止流水灯效果
         begin
            led <= 16'b0000000000000000;
            state <= all_state_s0;
         end
         
         if (flag == 1'b1)
		 // 控制信号为1时开启流水灯效果
            case (state)
               all_state_s0 :
                  begin
                     state <= all_state_s1;
                     led <= 16'b0000000110000000;
                  end
               all_state_s1 :
                  begin
                     state <= all_state_s2;
                     led <= 16'b0000001111000000;
                  end
               all_state_s2 :
                  begin
                     state <= all_state_s3;
                     led <= 16'b0000011111100000;
                  end
               all_state_s3 :
                  begin
                     state <= all_state_s4;
                     led <= 16'b0000111111110000;
                  end
               all_state_s4 :
                  begin
                     state <= all_state_s5;
                     led <= 16'b0001111111111000;
                  end
               all_state_s5 :
                  begin
                     state <= all_state_s6;
                     led <= 16'b0011111111111100;
                  end
               all_state_s6 :
                  begin
                     state <= all_state_s7;
                     led <= 16'b0111111111111110;
                  end
               all_state_s7 :
                  begin
                     state <= all_state_s8;
                     led <= 16'b1111111111111111;
                  end
               all_state_s8 :
                  begin
                     state <= all_state_s9;
                     led <= 16'b0111111111111110;
                  end
               all_state_s9 :
                  begin
                     state <= all_state_s10;
                     led <= 16'b0011111111111100;
                  end
               all_state_s10 :
                  begin
                     state <= all_state_s11;
                     led <= 16'b0001111111111000;
                  end
               all_state_s11 :
                  begin
                     state <= all_state_s12;
                     led <= 16'b0000111111110000;
                  end
               all_state_s12 :
                  begin
                     state <= all_state_s13;
                     led <= 16'b0000011111100000;
                  end
               all_state_s13 :
                  begin
                     state <= all_state_s14;
                     led <= 16'b0000001111000000;
                  end
               all_state_s14 :
                  begin
                     state <= all_state_s15;
                     led <= 16'b0000000110000000;
                  end
               all_state_s15 :
                  begin
                     state <= all_state_s0;
                     led <= 16'b0000000000000000;
                  end
            endcase
      end
   
endmodule
