
module LCD1602driver(LCD_Clk, LCD_RS, LCD_RW, LCD_EN, lcd_data, YIMA_DATA1, YIMA_DATA2, YIMA_DATA3, YIMA_DATA4, YIMA_DATA5, YIMA_DATA6, YIMA_DATA7, YIMA_DATA8, YIMA_DATA9, YIMA_DATA10, YIMA_DATA11, YIMA_DATA12);
   input        LCD_Clk;
   // 状态机时钟信号，同时也是液晶时钟信号，其周期应满足液晶数据的建立时间
   output       LCD_RS; //寄存器选择信号
   reg          LCD_RS;
   output       LCD_RW; //液晶读写信号
   output       LCD_EN; //液晶使能信号
   output [7:0] lcd_data;
   reg [7:0]    lcd_data; //液晶数据信号
   input [7:0]  YIMA_DATA1; //译码数据信号
   input [7:0]  YIMA_DATA2;
   input [7:0]  YIMA_DATA3;
   input [7:0]  YIMA_DATA4;
   input [7:0]  YIMA_DATA5;
   input [7:0]  YIMA_DATA6;
   input [7:0]  YIMA_DATA7;
   input [7:0]  YIMA_DATA8;
   input [7:0]  YIMA_DATA9;
   input [7:0]  YIMA_DATA10;
   input [7:0]  YIMA_DATA11;
   input [7:0]  YIMA_DATA12;
   
   reg [7:0]    ram1[0:28];  //声明一个存储器
   
   assign LCD_EN = LCD_Clk; //液晶时钟使能
   assign LCD_RW = 1'b0;
   
   always @(*) ram1[0] <= YIMA_DATA1; // 译码数据传递
   always @(*) ram1[1] <= YIMA_DATA2;
   always @(*) ram1[2] <= YIMA_DATA3;
   always @(*) ram1[3] <= YIMA_DATA4;
   always @(*) ram1[4] <= YIMA_DATA5;
   always @(*) ram1[5] <= YIMA_DATA6;
   always @(*) ram1[6] <= YIMA_DATA7;
   always @(*) ram1[7] <= YIMA_DATA8;
   always @(*) ram1[8] <= YIMA_DATA9;
   always @(*) ram1[9] <= YIMA_DATA10;
   always @(*) ram1[10] <= YIMA_DATA11;
   always @(*) ram1[11] <= YIMA_DATA12;
   
   
   always @(  LCD_Clk)
   begin: xhdl0
      reg [5:0]    cnt;
      
      
      begin
         if (cnt == 38)
            cnt = 0;
         else
            cnt = cnt + 1;
      end
      
      case (cnt)
	  // 循环刷新液晶显示信号
         0 :
            begin
               LCD_RS <= 1'b0;
               lcd_data <= 8'b00111000;
            end
         1 :
            begin
               LCD_RS <= 1'b0;
               lcd_data <= 8'b00001100;
            end
         2 :
            begin
               LCD_RS <= 1'b0;
               lcd_data <= 8'b00000001;
            end
         3 :
            begin
               LCD_RS <= 1'b0;
               lcd_data <= 8'b00000110;
            end
         4 :
            begin
               LCD_RS <= 1'b0;
               lcd_data <= 8'b10000000;
            end
         
         5 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         6 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         7 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b01000001;
            end
         8 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b00111110;
            end
         9 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[0];
            end
         10 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[1];
            end
         11 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         12 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b01000010;
            end
         13 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b00111110;
            end
         14 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[4];
            end
         15 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[5];
            end
         16 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         17 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b01000011;
            end
         18 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b00111110;
            end
         19 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[8];
            end
         20 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[9];
            end
         21 :
            begin
               LCD_RS <= 1'b0;
               lcd_data <= 8'b11000000;
            end
         22 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         23 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         24 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         25 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         26 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[2];
            end
         27 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[3];
            end
         28 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         29 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         30 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         31 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[6];
            end
         32 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[7];
            end
         33 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         34 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         35 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
         36 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[10];
            end
         37 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= ram1[11];
            end
         38 :
            begin
               LCD_RS <= 1'b1;
               lcd_data <= 8'b10100000;
            end
      endcase
   end
   
endmodule
