


module main(clkin, b0, b1, b2, b3, b4, b5, b6, nums, numb, dis1, dis2, dis3, dis4, dis5, dis6, dis7, dis8, dis9, dis10, dis11, dis12, seg_u1, seg_u2, seg_u3, state_out);
   input        clkin;
   input        b0;
   input        b1;
   input        b2;
   input        b3;
   input        b4;
   input        b5;
   input        b6;
   input [6:0]  nums;
   input [6:0]  numb;
   output [6:0] dis1;
   output [6:0] dis2;
   output [6:0] dis3;
   output [6:0] dis4;
   output [6:0] dis5;
   output [6:0] dis6;
   output [6:0] dis7;
   output [6:0] dis8;
   output [6:0] dis9;
   output [6:0] dis10;
   output [6:0] dis11;
   output [6:0] dis12;
   output [4:0] seg_u1;
   output [4:0] seg_u2;
   output [4:0] seg_u3;
   output [3:0] state_out;
   
   reg [3:0]    cnt_b0;
   reg [1:0]    cnt_b1;
   reg [0:0]    cnt_b2;
   reg [1:0]    cnt_b4;
   reg [1:0]    cnt_b5;
   reg [0:0]    cnt_b6;
   reg [3:0]    cnt_u1;
   reg [3:0]    cnt_u2;
   reg [3:0]    cnt_u3;
   reg [3:0]    cur_state;
   reg [6:0]    rs1;
   reg [6:0]    rs2;
   reg [6:0]    rb1;
   reg [6:0]    rb2;
   reg [6:0]    gs1;
   reg [6:0]    gs2;
   reg [6:0]    gb1;
   reg [6:0]    gb2;
   reg [6:0]    ys1;
   reg [6:0]    ys2;
   reg [6:0]    yb1;
   reg [6:0]    yb2;
   reg [3:0]    temp1;
   
   
   always @(posedge b0)
      
      begin
         if (cnt_b0 == 15)
            cnt_b0 <= 0;
         else
            cnt_b0 <= cnt_b0 + 1;
      end
   
   
   always @(b1)
      if ((cnt_b0 % 2) == 0)
         cnt_b1 <= 0;
      else if (b1 == 1'b1)
      begin
         if (cnt_b1 == 2)
            cnt_b1 <= 1;
         else
            cnt_b1 <= cnt_b1 + 1;
      end
   
   
   always @(b4)
      if ((cnt_b0 % 2) == 0)
         cnt_b4 <= 0;
      else if (b4 == 1'b1)
      begin
         if (cnt_b4 == 2)
            cnt_b4 <= 1;
         else
            cnt_b4 <= cnt_b4 + 1;
      end
   
   
   always @(b5)
      if ((cnt_b0 % 2) == 0)
         cnt_b5 <= 0;
      else if (b5 == 1'b1)
      begin
         if (cnt_b5 == 2)
            cnt_b5 <= 1;
         else
            cnt_b5 <= cnt_b5 + 1;
      end
   
   
   always @(b2)
      if ((cnt_b0 % 2) == 0)
         cnt_b2 <= 0;
      else if (b2 == 1'b1)
      begin
         if (cnt_b2 == 1)
            cnt_b2 <= 0;
         else
            cnt_b2 <= cnt_b2 + 1;
      end
   
   
   always @(b6)
      if ((cnt_b0 % 2) == 0)
         cnt_b6 <= 0;
      else if (b6 == 1'b1)
      begin
         if (cnt_b6 == 1)
            cnt_b6 <= 0;
         else
            cnt_b6 <= cnt_b6 + 1;
      end
   
   
   always @(cur_state or clkin or cnt_b0 or cnt_b1 or cnt_b2 or nums or numb or b3)
      
         case (cur_state)
            4'b0000 :
               if ((cnt_b0 % 2) == 1)
                  cur_state <= 4'b0001;
            4'b0001 :
               if (cnt_b1 == 1)
                  cur_state <= 4'b0010;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b0010 :
               if (cnt_b1 == 2)
                  cur_state <= 4'b1010;
               else if (cnt_b4 == 1)
                  cur_state <= 4'b0011;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b1010 :
               if (cnt_b4 == 1)
                  cur_state <= 4'b0011;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b0011 :
               if (cnt_b5 == 1)
                  cur_state <= 4'b0100;
               else if (cnt_b4 == 2)
                  cur_state <= 4'b1011;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b1011 :
               if (cnt_b5 == 1)
                  cur_state <= 4'b0100;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b0100 :
               if (cnt_b5 == 2)
                  cur_state <= 4'b1100;
               else if (cnt_b6 == 1)
                  cur_state <= 4'b1111;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b1100 :
               if (cnt_b6 == 1)
                  cur_state <= 4'b1111;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b1111 :
               if (cnt_b2 == 1)
                  cur_state <= 4'b0101;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b0101 :
               if ((nums == rs1 & numb == rb1) | (nums == rs2 & numb == rb2))
                  cur_state <= 4'b0110;
               else if ((nums == gs1 & numb == gb1) | (nums == gs2 & numb == gb2))
                  cur_state <= 4'b0111;
               else if ((nums == ys1 & numb == yb1) | (nums == ys2 & numb == yb2))
                  cur_state <= 4'b1000;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
               else
                  cur_state <= 4'b0101;
            4'b0110 :
               if ((nums == gs1 & numb == gb1) | (nums == gs2 & numb == gb2))
               begin
                  cur_state <= 4'b0111;
                  cnt_u1 <= cnt_u1 + 1;
               end
               else if ((nums == ys1 & numb == yb1) | (nums == ys2 & numb == yb2))
               begin
                  cur_state <= 4'b1000;
                  cnt_u1 <= cnt_u1 + 1;
               end
               else if (nums == 7'b1011111 & numb == 7'b1111110)
               begin
                  cur_state <= 4'b0101;
                  cnt_u1 <= cnt_u1 + 1;
               end
               else if ((cnt_b0 % 2) == 0)
               begin
                  cur_state <= 4'b0000;
                  cnt_u1 <= 0;
                  cnt_u2 <= 0;
                  cnt_u3 <= 0;
               end
               else if (temp1 == 4'b0101)
                  cur_state <= 4'b0101;
               else
                  cur_state <= 4'b0110;
            4'b0111 :
               if ((nums == rs1 & numb == rb1) | (nums == rs2 & numb == rb2))
               begin
                  cur_state <= 4'b0110;
                  cnt_u2 <= cnt_u2 + 1;
               end
               else if ((nums == ys1 & numb == yb1) | (nums == ys2 & numb == yb2))
               begin
                  cur_state <= 4'b1000;
                  cnt_u2 <= cnt_u2 + 1;
               end
               else if (nums == 7'b1011111 & numb == 7'b1111110)
               begin
                  cur_state <= 4'b0101;
                  cnt_u2 <= cnt_u2 + 1;
               end
               else if ((cnt_b0 % 2) == 0)
               begin
                  cur_state <= 4'b0000;
                  cnt_u1 <= 0;
                  cnt_u2 <= 0;
                  cnt_u3 <= 0;
               end
               else if (temp1 == 4'b0101)
                  cur_state <= 4'b0101;
               else
                  cur_state <= 4'b0111;
            4'b1000 :
               if ((nums == rs1 & numb == rb1) | (nums == rs2 & numb == rb2))
               begin
                  cur_state <= 4'b0110;
                  cnt_u3 <= cnt_u3 + 1;
               end
               else if ((nums == gs1 & numb == gb1) | (nums == gs2 & numb == gb2))
               begin
                  cur_state <= 4'b0111;
                  cnt_u3 <= cnt_u3 + 1;
               end
               else if (nums == 7'b1011111 & numb == 7'b1111110)
               begin
                  cur_state <= 4'b0101;
                  cnt_u3 <= cnt_u3 + 1;
               end
               else if ((cnt_b0 % 2) == 0)
               begin
                  cur_state <= 4'b0000;
                  cnt_u1 <= 0;
                  cnt_u2 <= 0;
                  cnt_u3 <= 0;
               end
               else if (temp1 == 4'b0101)
                  cur_state <= 4'b0101;
               else
                  cur_state <= 4'b1000;
            default :
               ;
         endcase
   
   
   always @(b3 or cur_state)
      if (cur_state != 4'b0110 & cur_state != 4'b0111 & cur_state != 4'b1000)
         temp1 <= 4'b0000;
      else 
      begin
         if (cur_state == 4'b0110 | cur_state == 4'b0111 | cur_state == 4'b1000)
            temp1 <= 4'b0101;
      end
   
   assign dis1 = rs1;
   assign dis2 = rb1;
   assign dis3 = rs2;
   assign dis4 = rb2;
   assign dis5 = gs1;
   assign dis6 = gb1;
   assign dis7 = gs2;
   assign dis8 = gb2;
   assign dis9 = ys1;
   assign dis10 = yb1;
   assign dis11 = ys2;
   assign dis12 = yb2;
   
   assign state_out = cur_state;
   assign seg_u1 = cnt_u1;
   assign seg_u2 = cnt_u2;
   assign seg_u3 = cnt_u3;
   
   
   always @(cur_state or clkin)
      
         case (cur_state)
            4'b0010 :
               begin
                  rs1 <= nums;
                  rb1 <= numb;
               end
            4'b1010 :
               begin
                  rs2 <= nums;
                  rb2 <= numb;
               end
            4'b0011 :
               begin
                  gs1 <= nums;
                  gb1 <= numb;
               end
            4'b1011 :
               begin
                  gs2 <= nums;
                  gb2 <= numb;
               end
            4'b0100 :
               begin
                  ys1 <= nums;
                  yb1 <= numb;
               end
            4'b1100 :
               begin
                  ys2 <= nums;
                  yb2 <= numb;
               end
            4'b0000 :
               begin
                  rs1 <= 7'b0000000;
                  rb1 <= 7'b0000000;
                  gs1 <= 7'b0000000;
                  gb1 <= 7'b0000000;
                  ys1 <= 7'b0000000;
                  yb1 <= 7'b0000000;
                  rs2 <= 7'b0000000;
                  rb2 <= 7'b0000000;
                  gs2 <= 7'b0000000;
                  gb2 <= 7'b0000000;
                  ys2 <= 7'b0000000;
                  yb2 <= 7'b0000000;
               end
            default :
               ;
         endcase
   
endmodule

