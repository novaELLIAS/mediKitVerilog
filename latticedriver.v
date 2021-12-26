

module latticeDriver(clk, clk_div1000, clk_div500, clk_div250, clk_div125, state_in, col_r, col_g, row);
   
   input        clk;
   input        clk_div1000;
   input        clk_div500;
   input        clk_div250;
   input        clk_div125;
   input [3:0]  state_in;
   output [7:0] col_r;
   reg [7:0]    col_r;
   output [7:0] col_g;
   reg [7:0]    col_g;
   output [7:0] row;
   reg [7:0]    row;
   
   
   reg [0:0]    sel2;
   reg [0:0]    sel2_2;
   reg [0:0]    sel2_4;
   reg [0:0]    sel2_8;
   reg [2:0]    sel8;
   
   
   always @(posedge clk)
   begin: p1
      
         sel8 <= sel8 + 1;
   end
   
   
   always @(posedge clk_div1000)
   begin: p2
      
         sel2 <= sel2 + 1;
   end
   
   
   always @(posedge clk_div500)
   begin: p3
      
         sel2_2 <= sel2_2 + 1;
   end
   
   
   always @(posedge clk_div250)
   begin: p4
      
         sel2_4 <= sel2_4 + 1;
   end
   
   
   always @(posedge clk_div125)
   begin: p5
      
         sel2_8 <= sel2_8 + 1;
   end
   
   
   always @(state_in or sel2 or sel8)
   begin: p6
      
      if (state_in == 4'b0000)
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
