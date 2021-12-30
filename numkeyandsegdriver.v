
module numKeyAndSegDriver(clkin, clk_div, cnt_u1, cnt_u2, cnt_u3, key_r, key_c, state_in, seg, cat, nums, numb);
   input        clkin;
   input        clk_div;
   input [4:0]  cnt_u1;
   input [4:0]  cnt_u2;
   input [4:0]  cnt_u3;
   input [3:0]  key_r; //4*4键盘行输入
   output [3:0] key_c; //4*4键盘列输出
   input [3:0]  state_in;
   output [6:0] seg; //输出到数码管
   reg [6:0]    seg;
   output [7:0] cat; //数码管段选
   reg [7:0]    cat;
   output [6:0] nums; //返回给main的当前输入值十位
   reg [6:0]    nums;
   output [6:0] numb; //返回给main的当前输入值个位
   reg [6:0]    numb;
   
   reg [3:0]    key_c0;
   reg [4:0]    C;
   reg [4:0]    pre;
   wire [0:0]   flag;
   reg [6:0]    nums_temp;
   reg [6:0]    numb_temp;
   reg [6:0]    seg_temp1;
   reg [6:0]    seg_temp2;
   reg [6:0]    seg_temp3;
   reg [6:0]    seg_temp4;
   reg [6:0]    seg_temp5;
   reg [6:0]    seg_temp6;
   reg [6:0]    seg_temp7;
   reg [6:0]    seg_temp8;
   reg [6:0]    seg_temp9;
   reg [6:0]    seg_temp10;
   reg [6:0]    seg_temp11;
   reg [6:0]    seg_temp12;
   reg [6:0]    seg_temp13;
   reg [6:0]    seg_temp14;
   reg [6:0]    seg_tempna;
   reg [6:0]    seg_tempnb;
   reg [5:0]    sel60; // %60计数器，用于流程控制
   wire [0:0]   count_btn3; // 初值为0，1、2、3分别代表停止红、绿、黄三药盒的提醒
   
   
   always @(  clkin)
   begin: P0
      reg [1:0]    sel4;
      
      begin
	  //键盘列信号循环扫描输
         case (sel4)
            0 :
               key_c0 <= 4'b1110;
            1 :
               key_c0 <= 4'b1101;
            2 :
               key_c0 <= 4'b1011;
            3 :
               key_c0 <= 4'b0111;
            default :
               ;
         endcase
         
         if (sel4 == 3)
            sel4 = 0;
         else
            sel4 = sel4 + 1;
      end
   end
   
   assign key_c = key_c0;
   
   
   always @(key_c0 or key_r or   clkin)
   //键盘行信号读入，配合列信号判断出当前按下的按键
   begin: P1
      
      begin
         if (state_in == 4'b0000)
            C <= 0;
         else
            case (key_c0)
               4'b1110 :
                  case (key_r)
                     4'b0111 :
                        C <= 1;
                     4'b1011 :
                        C <= 5;
                     4'b1101 :
                        C <= 9;
                     4'b1110 :
                        C <= 13;
                     default :
                        C <= C;
                  endcase
               4'b1101 :
                  case (key_r)
                     4'b0111 :
                        C <= 2;
                     4'b1011 :
                        C <= 6;
                     4'b1101 :
                        C <= 10;
                     4'b1110 :
                        C <= 14;
                     default :
                        C <= C;
                  endcase
               4'b1011 :
                  case (key_r)
                     4'b0111 :
                        C <= 3;
                     4'b1011 :
                        C <= 7;
                     4'b1101 :
                        C <= 11;
                     4'b1110 :
                        C <= 15;
                     default :
                        C <= C;
                  endcase
               4'b0111 :
                  case (key_r)
                     4'b0111 :
                        C <= 4;
                     4'b1011 :
                        C <= 8;
                     4'b1101 :
                        C <= 12;
                     4'b1110 :
                        C <= 16;
                     default :
                        C <= C;
                  endcase
               default :
                  C <= C;
            endcase
      end
   end
   
   
   always @(  clkin)
      
      begin
	  //当程序处于设置三个药盒状态的状态中时，将按下按键的值实时返回给main
         if (state_in == 4'b0010 | state_in == 4'b0011 | state_in == 4'b0100 | state_in == 4'b1010 | state_in == 4'b1011 | state_in == 4'b1100)
            case (C)
               1 :
                  nums_temp <= 7'b1111110;
               2 :
                  nums_temp <= 7'b0110000;
               3 :
                  nums_temp <= 7'b1101101;
               4 :
                  nums_temp <= 7'b1111001;
               5 :
                  nums_temp <= 7'b0110011;
               6 :
                  nums_temp <= 7'b1011011;
               
               7 :
                  numb_temp <= 7'b1111110;
               8 :
                  numb_temp <= 7'b0110000;
               9 :
                  numb_temp <= 7'b1101101;
               10 :
                  numb_temp <= 7'b1111001;
               11 :
                  numb_temp <= 7'b0110011;
               12 :
                  numb_temp <= 7'b1011011;
               13 :
                  numb_temp <= 7'b1011111;
               14 :
                  numb_temp <= 7'b1110000;
               15 :
                  numb_temp <= 7'b1111111;
               16 :
                  numb_temp <= 7'b1111011;
               default :
                  ;
            endcase
         else if (state_in == 4'b1111)
		 //当程序处于设定完毕状态时，数码管状态归零
         begin
            nums_temp <= 7'b1111110;
            numb_temp <= 7'b1111110;
         end
         else
         begin
            case (sel60/10)
               0 :
                  nums_temp <= 7'b1111110;
               1 :
                  nums_temp <= 7'b0110000;
               2 :
                  nums_temp <= 7'b1101101;
               3 :
                  nums_temp <= 7'b1111001;
               4 :
                  nums_temp <= 7'b0110011;
               5 :
                  nums_temp <= 7'b1011011;
               6 :
                  nums_temp <= 7'b1011111;
               default :
                  ;
            endcase
            case (sel60 % 10)
               0 :
                  numb_temp <= 7'b1111110;
               1 :
                  numb_temp <= 7'b0110000;
               2 :
                  numb_temp <= 7'b1101101;
               3 :
                  numb_temp <= 7'b1111001;
               4 :
                  numb_temp <= 7'b0110011;
               5 :
                  numb_temp <= 7'b1011011;
               6 :
                  numb_temp <= 7'b1011111;
               7 :
                  numb_temp <= 7'b1110000;
               8 :
                  numb_temp <= 7'b1111111;
               9 :
                  numb_temp <= 7'b1111011;
               default :
                  ;
            endcase
         end
         nums <= nums_temp;
         numb <= numb_temp;
      end
   
   
   always @(  clkin or state_in or sel60)
   begin: p2
      reg [2:0]    count;
      
      begin
         if (state_in == 4'b0000 | state_in == 4'b0001)
		 //当药盒处于关闭和初始状态时，数码管不亮
            cat <= 8'b11111111;
         else
            case (count)
               0 :
			   //当药盒处于设定时间状态时，数码管显示输入的值的十位
                  begin
                     cat <= 8'b11111101;
                     count = 1;
                     if (state_in == 4'b0010)
                        seg <= seg_temp1;
                     else if (state_in == 4'b0011)
                        seg <= seg_temp3;
                     else if (state_in == 4'b0100)
                        seg <= seg_temp5;
                     else if (state_in == 4'b1010)
                        seg <= seg_temp9;
                     else if (state_in == 4'b1011)
                        seg <= seg_temp11;
                     else if (state_in == 4'b1100)
                        seg <= seg_temp13;
                     else if (state_in == 4'b1111)
                        seg <= 7'b1111110;
                     else if (state_in == 4'b0101 | state_in == 4'b0110 | state_in == 4'b0111 | state_in == 4'b1000)
                     begin
					 //当药盒处于计时状态，数码管显示计时值的十位
                        case (sel60/10)
                           0 :
                              seg_temp7 <= 7'b1111110;
                           1 :
                              seg_temp7 <= 7'b0110000;
                           2 :
                              seg_temp7 <= 7'b1101101;
                           3 :
                              seg_temp7 <= 7'b1111001;
                           4 :
                              seg_temp7 <= 7'b0110011;
                           5 :
                              seg_temp7 <= 7'b1011011;
                           6 :
                              seg_temp7 <= 7'b1011111;
                           default :
                              ;
                        endcase
                        seg <= seg_temp7;
                     end
                  end
               1 :
                  begin
                     cat <= 8'b11111110;
                     count = 2;
                     if (state_in == 4'b0010)
                        seg <= seg_temp2;
                     else if (state_in == 4'b0011)
                        seg <= seg_temp4;
                     else if (state_in == 4'b0100)
                        seg <= seg_temp6;
                     else if (state_in == 4'b1010)
                        seg <= seg_temp10;
                     else if (state_in == 4'b1011)
                        seg <= seg_temp12;
                     else if (state_in == 4'b1100)
                        seg <= seg_temp14;
                     else if (state_in == 4'b1111)
                        seg <= 7'b1010111;
                     else if (state_in == 4'b0101 | state_in == 4'b0110 | state_in == 4'b0111 | state_in == 4'b1000)
                     begin
                        case (sel60 % 10)
                           0 :
                              seg_temp8 <= 7'b1111110;
                           1 :
                              seg_temp8 <= 7'b0110000;
                           2 :
                              seg_temp8 <= 7'b1101101;
                           3 :
                              seg_temp8 <= 7'b1111001;
                           4 :
                              seg_temp8 <= 7'b0110011;
                           5 :
                              seg_temp8 <= 7'b1011011;
                           6 :
                              seg_temp8 <= 7'b1011111;
                           7 :
                              seg_temp8 <= 7'b1110000;
                           8 :
                              seg_temp8 <= 7'b1111111;
                           9 :
                              seg_temp8 <= 7'b1111011;
                           default :
                              ;
                        endcase
                        seg <= seg_temp8;
                     end
                  end
               2 :
                  begin
                     case (cnt_u2 % 10)
                        0 :
                           seg_tempnb <= 7'b1111110;
                        1 :
                           seg_tempnb <= 7'b0110000;
                        2 :
                           seg_tempnb <= 7'b1101101;
                        3 :
                           seg_tempnb <= 7'b1111001;
                        4 :
                           seg_tempnb <= 7'b0110011;
                        5 :
                           seg_tempnb <= 7'b1011011;
                        6 :
                           seg_tempnb <= 7'b1011111;
                        7 :
                           seg_tempnb <= 7'b1110000;
                        8 :
                           seg_tempnb <= 7'b1111111;
                        9 :
                           seg_tempnb <= 7'b1111011;
                        default :
                           ;
                     endcase
                     cat <= 8'b10111111;
                     seg <= seg_tempnb;
                     count = 3;
                  end
               3 :
                  begin
                     case ((cnt_u2/10) % 10)
                        0 :
                           seg_tempna <= 7'b1111110;
                        1 :
                           seg_tempna <= 7'b0110000;
                        2 :
                           seg_tempna <= 7'b1101101;
                        3 :
                           seg_tempna <= 7'b1111001;
                        4 :
                           seg_tempna <= 7'b0110011;
                        5 :
                           seg_tempna <= 7'b1011011;
                        6 :
                           seg_tempna <= 7'b1011111;
                        7 :
                           seg_tempna <= 7'b1110000;
                        8 :
                           seg_tempna <= 7'b1111111;
                        9 :
                           seg_tempna <= 7'b1111011;
                        default :
                           ;
                     endcase
                     cat <= 8'b01111111;
                     seg <= seg_tempna;
                     count = 4;
                  end
               4 :
                  begin
                     case (cnt_u3 % 10)
                        0 :
                           seg_tempnb <= 7'b1111110;
                        1 :
                           seg_tempnb <= 7'b0110000;
                        2 :
                           seg_tempnb <= 7'b1101101;
                        3 :
                           seg_tempnb <= 7'b1111001;
                        4 :
                           seg_tempnb <= 7'b0110011;
                        5 :
                           seg_tempnb <= 7'b1011011;
                        6 :
                           seg_tempnb <= 7'b1011111;
                        7 :
                           seg_tempnb <= 7'b1110000;
                        8 :
                           seg_tempnb <= 7'b1111111;
                        9 :
                           seg_tempnb <= 7'b1111011;
                        default :
                           ;
                     endcase
                     cat <= 8'b11101111;
                     seg <= seg_tempnb;
                     count = 5;
                  end
               5 :
                  begin
                     case ((cnt_u3/10) % 10)
                        0 :
                           seg_tempna <= 7'b1111110;
                        1 :
                           seg_tempna <= 7'b0110000;
                        2 :
                           seg_tempna <= 7'b1101101;
                        3 :
                           seg_tempna <= 7'b1111001;
                        4 :
                           seg_tempna <= 7'b0110011;
                        5 :
                           seg_tempna <= 7'b1011011;
                        6 :
                           seg_tempna <= 7'b1011111;
                        7 :
                           seg_tempna <= 7'b1110000;
                        8 :
                           seg_tempna <= 7'b1111111;
                        9 :
                           seg_tempna <= 7'b1111011;
                        default :
                           ;
                     endcase
                     cat <= 8'b11011111;
                     seg <= seg_tempna;
                     count = 6;
                  end
               6 :
                  begin
                     case (cnt_u1 % 10)
                        0 :
                           seg_tempnb <= 7'b1111110;
                        1 :
                           seg_tempnb <= 7'b0110000;
                        2 :
                           seg_tempnb <= 7'b1101101;
                        3 :
                           seg_tempnb <= 7'b1111001;
                        4 :
                           seg_tempnb <= 7'b0110011;
                        5 :
                           seg_tempnb <= 7'b1011011;
                        6 :
                           seg_tempnb <= 7'b1011111;
                        7 :
                           seg_tempnb <= 7'b1110000;
                        8 :
                           seg_tempnb <= 7'b1111111;
                        9 :
                           seg_tempnb <= 7'b1111011;
                        default :
                           ;
                     endcase
                     cat <= 8'b11111011;
                     seg <= seg_tempnb;
                     count = 7;
                  end
               7 :
                  begin
                     case ((cnt_u1/10) % 10)
                        0 :
                           seg_tempna <= 7'b1111110;
                        1 :
                           seg_tempna <= 7'b0110000;
                        2 :
                           seg_tempna <= 7'b1101101;
                        3 :
                           seg_tempna <= 7'b1111001;
                        4 :
                           seg_tempna <= 7'b0110011;
                        5 :
                           seg_tempna <= 7'b1011011;
                        6 :
                           seg_tempna <= 7'b1011111;
                        7 :
                           seg_tempna <= 7'b1110000;
                        8 :
                           seg_tempna <= 7'b1111111;
                        9 :
                           seg_tempna <= 7'b1111011;
                        default :
                           ;
                     endcase
                     cat <= 8'b11110111;
                     seg <= seg_tempna;
                     count = 0;
                  end
               default :
                  ;
            endcase
      end
   end
   
   
   always @(clkin or state_in)
   begin: p3
      if (pre != C)
      begin
         if (clkin == 1'b1)
         begin
            pre <= C;
			
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

            if (state_in == 4'b0000)
			//进入关机状态，之前存储的药盒提醒时间清零
            begin
               seg_temp1 <= 7'b1111110;
               seg_temp2 <= 7'b1111110;
               seg_temp3 <= 7'b1111110;
               seg_temp4 <= 7'b1111110;
               seg_temp5 <= 7'b1111110;
               seg_temp6 <= 7'b1111110;
            end
            
            else if (state_in == 4'b0010)
			//每个药盒比之前可能多了一个状态，因此所要存储的数据成倍增加
               case (C)
                  1 :
				  //进入药盒一第一输入状态，写入数据
                     seg_temp1 <= 7'b1111110;
                  2 :
                     seg_temp1 <= 7'b0110000;
                  3 :
                     seg_temp1 <= 7'b1101101;
                  4 :
                     seg_temp1 <= 7'b1111001;
                  5 :
                     seg_temp1 <= 7'b0110011;
                  6 :
                     seg_temp1 <= 7'b1011011;
                  
                  7 :
                     seg_temp2 <= 7'b1111110;
                  8 :
                     seg_temp2 <= 7'b0110000;
                  9 :
                     seg_temp2 <= 7'b1101101;
                  10 :
                     seg_temp2 <= 7'b1111001;
                  11 :
                     seg_temp2 <= 7'b0110011;
                  12 :
                     seg_temp2 <= 7'b1011011;
                  13 :
                     seg_temp2 <= 7'b1011111;
                  14 :
                     seg_temp2 <= 7'b1110000;
                  15 :
                     seg_temp2 <= 7'b1111111;
                  16 :
                     seg_temp2 <= 7'b1111011;
                  default :
                     ;
               endcase
            else if (state_in == 4'b0011)
			//进入药盒二第一输入状态，写入
               case (C)
                  1 :
                     seg_temp3 <= 7'b1111110;
                  2 :
                     seg_temp3 <= 7'b0110000;
                  3 :
                     seg_temp3 <= 7'b1101101;
                  4 :
                     seg_temp3 <= 7'b1111001;
                  5 :
                     seg_temp3 <= 7'b0110011;
                  6 :
                     seg_temp3 <= 7'b1011011;
                  
                  7 :
                     seg_temp4 <= 7'b1111110;
                  8 :
                     seg_temp4 <= 7'b0110000;
                  9 :
                     seg_temp4 <= 7'b1101101;
                  10 :
                     seg_temp4 <= 7'b1111001;
                  11 :
                     seg_temp4 <= 7'b0110011;
                  12 :
                     seg_temp4 <= 7'b1011011;
                  13 :
                     seg_temp4 <= 7'b1011111;
                  14 :
                     seg_temp4 <= 7'b1110000;
                  15 :
                     seg_temp4 <= 7'b1111111;
                  16 :
                     seg_temp4 <= 7'b1111011;
                  default :
                     ;
               endcase
            else if (state_in == 4'b0100)
               case (C)
                  1 :
                     seg_temp5 <= 7'b1111110;
                  2 :
                     seg_temp5 <= 7'b0110000;
                  3 :
                     seg_temp5 <= 7'b1101101;
                  4 :
                     seg_temp5 <= 7'b1111001;
                  5 :
                     seg_temp5 <= 7'b0110011;
                  6 :
                     seg_temp5 <= 7'b1011011;
                  
                  7 :
                     seg_temp6 <= 7'b1111110;
                  8 :
                     seg_temp6 <= 7'b0110000;
                  9 :
                     seg_temp6 <= 7'b1101101;
                  10 :
                     seg_temp6 <= 7'b1111001;
                  11 :
                     seg_temp6 <= 7'b0110011;
                  12 :
                     seg_temp6 <= 7'b1011011;
                  13 :
                     seg_temp6 <= 7'b1011111;
                  14 :
                     seg_temp6 <= 7'b1110000;
                  15 :
                     seg_temp6 <= 7'b1111111;
                  16 :
                     seg_temp6 <= 7'b1111011;
                  default :
                     ;
               endcase
            else if (state_in == 4'b1010)
               case (C)
                  1 :
                     seg_temp9 <= 7'b1111110;
                  2 :
                     seg_temp9 <= 7'b0110000;
                  3 :
                     seg_temp9 <= 7'b1101101;
                  4 :
                     seg_temp9 <= 7'b1111001;
                  5 :
                     seg_temp9 <= 7'b0110011;
                  6 :
                     seg_temp9 <= 7'b1011011;
                  
                  7 :
                     seg_temp10 <= 7'b1111110;
                  8 :
                     seg_temp10 <= 7'b0110000;
                  9 :
                     seg_temp10 <= 7'b1101101;
                  10 :
                     seg_temp10 <= 7'b1111001;
                  11 :
                     seg_temp10 <= 7'b0110011;
                  12 :
                     seg_temp10 <= 7'b1011011;
                  13 :
                     seg_temp10 <= 7'b1011111;
                  14 :
                     seg_temp10 <= 7'b1110000;
                  15 :
                     seg_temp10 <= 7'b1111111;
                  16 :
                     seg_temp10 <= 7'b1111011;
                  default :
                     ;
               endcase
            else if (state_in == 4'b1011)
               case (C)
                  1 :
                     seg_temp11 <= 7'b1111110;
                  2 :
                     seg_temp11 <= 7'b0110000;
                  3 :
                     seg_temp11 <= 7'b1101101;
                  4 :
                     seg_temp11 <= 7'b1111001;
                  5 :
                     seg_temp11 <= 7'b0110011;
                  6 :
                     seg_temp11 <= 7'b1011011;
                  
                  7 :
                     seg_temp12 <= 7'b1111110;
                  8 :
                     seg_temp12 <= 7'b0110000;
                  9 :
                     seg_temp12 <= 7'b1101101;
                  10 :
                     seg_temp12 <= 7'b1111001;
                  11 :
                     seg_temp12 <= 7'b0110011;
                  12 :
                     seg_temp12 <= 7'b1011011;
                  13 :
                     seg_temp12 <= 7'b1011111;
                  14 :
                     seg_temp12 <= 7'b1110000;
                  15 :
                     seg_temp12 <= 7'b1111111;
                  16 :
                     seg_temp12 <= 7'b1111011;
                  default :
                     ;
               endcase
            else if (state_in == 4'b1100)
               case (C)
                  1 :
                     seg_temp13 <= 7'b1111110;
                  2 :
                     seg_temp13 <= 7'b0110000;
                  3 :
                     seg_temp13 <= 7'b1101101;
                  4 :
                     seg_temp13 <= 7'b1111001;
                  5 :
                     seg_temp13 <= 7'b0110011;
                  6 :
                     seg_temp13 <= 7'b1011011;
                  
                  7 :
                     seg_temp14 <= 7'b1111110;
                  8 :
                     seg_temp14 <= 7'b0110000;
                  9 :
                     seg_temp14 <= 7'b1101101;
                  10 :
                     seg_temp14 <= 7'b1111001;
                  11 :
                     seg_temp14 <= 7'b0110011;
                  12 :
                     seg_temp14 <= 7'b1011011;
                  13 :
                     seg_temp14 <= 7'b1011111;
                  14 :
                     seg_temp14 <= 7'b1110000;
                  15 :
                     seg_temp14 <= 7'b1111111;
                  16 :
                     seg_temp14 <= 7'b1111011;
                  default :
                     ;
               endcase
         end
      end
   end
   
   
   always @(clk_div or state_in or sel60)
   begin: p4
   //模60计数器
      if (state_in == 4'b0000)
         sel60 <= 0;
      else if (state_in == 4'b0101 | state_in == 4'b0110 | state_in == 4'b0111 | state_in == 4'b1000)
      begin
         if (clk_div == 1'b1)
            sel60 <= sel60 + 1;
         if (sel60 == 60)
            sel60 <= 0;
         if (state_in == 4'b0000)
            sel60 <= 0;
      end
   end
   
endmodule

