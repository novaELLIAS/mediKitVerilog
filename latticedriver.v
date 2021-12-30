
module latticeDriver(clk, clk_div1000, clk_div500, clk_div250, clk_div125, state_in, col_r, col_g, row);
   
   input        clk; // 原始时钟（1kHz），用于扫描
   input        clk_div1000; //分频时钟（1Hz）
   input        clk_div500; //分频时钟（2Hz）
   input        clk_div250; //分频时钟（4Hz）
   input        clk_div125; //分频时钟（8Hz）
   input [3:0]  state_in; //状态机当前状态传递
   output [7:0] col_r; //红灯的控制显示
   reg [7:0]    col_r; 
   output [7:0] col_g; //绿灯的控制显示
   reg [7:0]    col_g;
   output [7:0] row; //二极管阴极扫描
   reg [7:0]    row;
   
   
   reg [0:0]    sel2; //模2计数器的信号
   reg [0:0]    sel2_2;
   reg [0:0]    sel2_4;
   reg [0:0]    sel2_8;
   reg [2:0]    sel8; //模8计数器的信号
   
//////////////////// 计数器维护 ////////////////////
   always @(  clk)
   begin: p1
      
         sel8 <= sel8 + 1;
   end
   
   
   always @(  clk_div1000)
   begin: p2
      
         sel2 <= sel2 + 1;
   end
   
   
   always @(  clk_div500)
   begin: p3
      
         sel2_2 <= sel2_2 + 1;
   end
   
   
   always @(  clk_div250)
   begin: p4
      
         sel2_4 <= sel2_4 + 1;
   end
   
   
   always @(  clk_div125)
   begin: p5
      
         sel2_8 <= sel2_8 + 1;
   end

//////////////////// 计数器结束 ////////////////////   

   always @(state_in or sel2 or sel8)
   begin: p6
      
      if (state_in == 4'b0000)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel8)
            3'o7 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b01111111;
               end
            3'o6 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b10111111;
               end
            3'o5 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11011111;
               end
            3'o4 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11101111;
               end
            3'o3 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11110111;
               end
            3'o2 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11111011;
               end
            3'o1 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11111101;
               end
            3'o0 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11111110;
               end
         endcase
      
      else if (state_in == 4'b0001 | state_in == 4'b0101 | state_in == 4'b1111)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel8)
            3'o7 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b01111111;
               end
            3'o6 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b10111111;
               end
            3'o5 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11011111;
               end
            3'o4 :
               begin
                  col_r <= 8'b11000011;
                  col_g <= 8'b11011000;
                  row <= 8'b11101111;
               end
            3'o3 :
               begin
                  col_r <= 8'b11000011;
                  col_g <= 8'b11011000;
                  row <= 8'b11110111;
               end
            3'o2 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11111011;
               end
            3'o1 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11111101;
               end
            3'o0 :
               begin
                  col_r <= 8'b00000000;
                  col_g <= 8'b00000000;
                  row <= 8'b11111110;
               end
         endcase
      
      else if (state_in == 4'b0010 | state_in == 4'b1010)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel2_2)
            1'b0 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
            1'b1 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000000;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000000;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
         endcase
      else if (state_in == 4'b0011 | state_in == 4'b1011)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel2_2)
            1'b0 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
            1'b1 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11000000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11000000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
         endcase
      else if (state_in == 4'b0100 | state_in == 4'b1100)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel2_2)
            1'b0 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
            1'b1 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b00000011;
                        col_g <= 8'b00011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b00000011;
                        col_g <= 8'b00011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
         endcase
      else if (state_in == 4'b0110)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel2_8)
            1'b0 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
            1'b1 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000000;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000000;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
         endcase
      
      else if (state_in == 4'b0111)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel2_8)
            1'b0 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
            1'b1 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11000000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11000000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
         endcase
      else if (state_in == 4'b1000)
	  
// state machINe status description:
// standard group:
// 0010 :  2 : set first  time for R box
// 0011 :  3 : set first  time for B box
// 0100 :  4 : set first  time for Y box
// 1010 : 10 : set second time for R box
// 1011 : 11 : set second time for B box
// 1100 : 12 : set second time for Y box
// 0101 :  5 : cnt down start
// 0110 :  6 : R box alert triggered
// 0111 :  7 : G box alert triggered
// 1000 :  8 : Y box alert triggered
// specialized group:
// 0000 :  0 : power off
// 0001 :  1 : power on
// 1111 : 31 : set finish

         case (sel2_8)
            1'b0 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b11000011;
                        col_g <= 8'b11011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
            1'b1 :
               case (sel8)
                  3'o7 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b01111111;
                     end
                  3'o6 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b10111111;
                     end
                  3'o5 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11011111;
                     end
                  3'o4 :
                     begin
                        col_r <= 8'b00000011;
                        col_g <= 8'b00011000;
                        row <= 8'b11101111;
                     end
                  3'o3 :
                     begin
                        col_r <= 8'b00000011;
                        col_g <= 8'b00011000;
                        row <= 8'b11110111;
                     end
                  3'o2 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111011;
                     end
                  3'o1 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111101;
                     end
                  3'o0 :
                     begin
                        col_r <= 8'b00000000;
                        col_g <= 8'b00000000;
                        row <= 8'b11111110;
                     end
               endcase
         endcase
   end
   
endmodule
