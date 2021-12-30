
module main(clkin, b0, b1, b2, b3, b4, b5, b6, nums, numb, dis1, dis2, dis3, dis4, dis5, dis6, dis7, dis8, dis9, dis10, dis11, dis12, seg_u1, seg_u2, seg_u3, state_out);
   input        clkin;
   input        b0; // 按键btn
   input        b1;
   input        b2;
   input        b3;
   input        b4;
   input        b5;
   input        b6;
   input [6:0]  nums; // 键盘返回十位
   input [6:0]  numb; // 键盘返回个位
   output [6:0] dis1; // 给LCD的药盒设定时间，三个两位数
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
   output [4:0] seg_u1; // 给数码管传递没有按时服药的次数
   output [4:0] seg_u2;
   output [4:0] seg_u3;
   output [3:0] state_out; // 传递当前状态
   
   reg [3:0]    cnt_b0; // 分别记录每个按键按下次数
   reg [1:0]    cnt_b1;
   reg [0:0]    cnt_b2;
   reg [1:0]    cnt_b4;
   reg [1:0]    cnt_b5;
   reg [0:0]    cnt_b6;
   reg [4:0]    cnt_u1; // 记录没有按时吃药的次数
   reg [4:0]    cnt_u2;
   reg [4:0]    cnt_u3;
   reg [3:0]    cur_state;
   reg [6:0]    rs1; // 记录三个药盒所设定的提醒时间
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
   
////////////////////////////////按键计数//////////////////////////////-

   always @(b0)
      
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
   
////////////////////////////////计数结束//////////////////////////////-

////////////////////////////////-状态机////////////////////////////////-

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

   always @(cur_state or clkin or cnt_b0 or cnt_b1 or cnt_b2 or nums or numb or b3)
      
         case (cur_state)
            4'b0000 : 
               if ((cnt_b0 % 2) == 1) // 按btn0启动
                  cur_state <= 4'b0001;
            4'b0001 :
               if (cnt_b1 == 1) // 按btn1进入时间设置
                  cur_state <= 4'b0010;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b0010 : // 按btn1进入下一个药盒时间设置
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
            4'b0100 : // 设置完毕状态
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
            4'b1111 : // 进入计时状态
               if (cnt_b2 == 1)
                  cur_state <= 4'b0101;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
            4'b0101 :
               if ((nums == rs1 & numb == rb1) | (nums == rs2 & numb == rb2)) // 触发药盒提醒
                  cur_state <= 4'b0110;
               else if ((nums == gs1 & numb == gb1) | (nums == gs2 & numb == gb2))
                  cur_state <= 4'b0111;
               else if ((nums == ys1 & numb == yb1) | (nums == ys2 & numb == yb2))
                  cur_state <= 4'b1000;
               else if ((cnt_b0 % 2) == 0)
                  cur_state <= 4'b0000;
               else
                  cur_state <= 4'b0101;
            4'b0110 : // 处在提醒状态
               if ((nums == gs1 & numb == gb1) | (nums == gs2 & numb == gb2))
               begin // 到其他药盒提醒时间
                  cur_state <= 4'b0111; // 状态转移
                  cnt_u1 <= cnt_u1 + 1; // 未及时服药，对应的计数器+1
               end
               else if ((nums == ys1 & numb == yb1) | (nums == ys2 & numb == yb2))
               begin
                  cur_state <= 4'b1000;
                  cnt_u1 <= cnt_u1 + 1;
               end
               else if (nums == 7'b1011011 & numb == 7'b1111011)
               begin // 满60秒归零
                  cur_state <= 4'b0101;
                  cnt_u1 <= cnt_u1 + 1;
               end
               else if ((cnt_b0 % 2) == 0)
               begin // 关机重置
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
               else if (nums == 7'b1011011 & numb == 7'b1111011)
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
               else if (nums == 7'b1011011 & numb == 7'b1111011)
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
   
   
   always @(  b3 or cur_state) // 判断是否停止提示
      if (cur_state != 4'b0110 & cur_state != 4'b0111 & cur_state != 4'b1000)
         temp1 <= 4'b0000; // 重置无效
      else 
      begin
         if (cur_state == 4'b0110 | cur_state == 4'b0111 | cur_state == 4'b1000)
            temp1 <= 4'b0101; // 重置有效
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
   
////////////////////////////////操作用户设定//////////////////////////////-
   
   always @(cur_state or   clkin)
      
         case (cur_state)
         // 读取设定的三个药盒的服药时间
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
               // 当关机时清除所有状态
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


