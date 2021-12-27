

module mediKitVerilog(
	clock,
	btn0,
	btn1,
	btn2,
	btn3,
	btn4,
	btn5,
	btn6,
	key_row,
	buzz_out,
	LCD_RS,
	LCD_RW,
	LCD_EN,
	cat,
	col_green,
	col_red,
	key_column,
	LCD_data,
	led,
	row_control,
	seg
);


input wire	clock;
input wire	btn0;
input wire	btn1;
input wire	btn2;
input wire	btn3;
input wire	btn4;
input wire	btn5;
input wire	btn6;
input wire	[3:0] key_row;
output wire	buzz_out;
output wire	LCD_RS;
output wire	LCD_RW;
output wire	LCD_EN;
output wire	[7:0] cat;
output wire	[7:0] col_green;
output wire	[7:0] col_red;
output wire	[3:0] key_column;
output wire	[7:0] LCD_data;
output wire	[15:0] led;
output wire	[7:0] row_control;
output wire	[6:0] seg;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[6:0] SYNTHESIZED_WIRE_8;
wire	[6:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_13;
wire	[3:0] SYNTHESIZED_WIRE_51;
wire	[4:0] SYNTHESIZED_WIRE_20;
wire	[4:0] SYNTHESIZED_WIRE_21;
wire	[4:0] SYNTHESIZED_WIRE_22;
wire	[7:0] SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	[7:0] SYNTHESIZED_WIRE_28;
wire	[7:0] SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	[7:0] SYNTHESIZED_WIRE_31;
wire	[7:0] SYNTHESIZED_WIRE_32;
wire	[7:0] SYNTHESIZED_WIRE_33;
wire	[7:0] SYNTHESIZED_WIRE_34;
wire	[7:0] SYNTHESIZED_WIRE_35;
wire	[6:0] SYNTHESIZED_WIRE_36;
wire	[6:0] SYNTHESIZED_WIRE_37;
wire	[6:0] SYNTHESIZED_WIRE_38;
wire	[6:0] SYNTHESIZED_WIRE_39;
wire	[6:0] SYNTHESIZED_WIRE_40;
wire	[6:0] SYNTHESIZED_WIRE_41;
wire	[6:0] SYNTHESIZED_WIRE_42;
wire	[6:0] SYNTHESIZED_WIRE_43;
wire	[6:0] SYNTHESIZED_WIRE_44;
wire	[6:0] SYNTHESIZED_WIRE_45;
wire	[6:0] SYNTHESIZED_WIRE_46;
wire	[6:0] SYNTHESIZED_WIRE_47;





keyinput	b2v_inst(
	.clk(clock),
	.clkt(SYNTHESIZED_WIRE_0),
	.btn0(btn0),
	.btn1(btn1),
	.btn2(btn2),
	.btn3(btn3),
	.btn4(btn4),
	.btn5(btn5),
	.btn6(btn6),
	.bout0(SYNTHESIZED_WIRE_1),
	.bout1(SYNTHESIZED_WIRE_2),
	.bout2(SYNTHESIZED_WIRE_3),
	.bout3(SYNTHESIZED_WIRE_4),
	.bout4(SYNTHESIZED_WIRE_5),
	.bout5(SYNTHESIZED_WIRE_6),
	.bout6(SYNTHESIZED_WIRE_7));


main	b2v_inst14(
	.clkin(clock),
	.b0(SYNTHESIZED_WIRE_1),
	.b1(SYNTHESIZED_WIRE_2),
	.b2(SYNTHESIZED_WIRE_3),
	.b3(SYNTHESIZED_WIRE_4),
	.b4(SYNTHESIZED_WIRE_5),
	.b5(SYNTHESIZED_WIRE_6),
	.b6(SYNTHESIZED_WIRE_7),
	.numb(SYNTHESIZED_WIRE_8),
	.nums(SYNTHESIZED_WIRE_9),
	.dis1(SYNTHESIZED_WIRE_36),
	.dis10(SYNTHESIZED_WIRE_45),
	.dis11(SYNTHESIZED_WIRE_46),
	.dis12(SYNTHESIZED_WIRE_47),
	.dis2(SYNTHESIZED_WIRE_37),
	.dis3(SYNTHESIZED_WIRE_38),
	.dis4(SYNTHESIZED_WIRE_39),
	.dis5(SYNTHESIZED_WIRE_40),
	.dis6(SYNTHESIZED_WIRE_41),
	.dis7(SYNTHESIZED_WIRE_42),
	.dis8(SYNTHESIZED_WIRE_43),
	.dis9(SYNTHESIZED_WIRE_44),
	.seg_u1(SYNTHESIZED_WIRE_20),
	.seg_u2(SYNTHESIZED_WIRE_21),
	.seg_u3(SYNTHESIZED_WIRE_22),
	.state_out(SYNTHESIZED_WIRE_51));


freqDiv_1000	b2v_inst23(
	.clk(clock),
	.clk_out(SYNTHESIZED_WIRE_48));


freqDiv_500	b2v_inst26(
	.clk(clock),
	.clk_out(SYNTHESIZED_WIRE_49));


freqDiv_250	b2v_inst28(
	.clk(clock),
	.clk_out(SYNTHESIZED_WIRE_50));


freqDiv_125	b2v_inst29(
	.clk(clock),
	.clk_out(SYNTHESIZED_WIRE_13));


latticeDriver	b2v_inst30(
	.clk(clock),
	.clk_div1000(SYNTHESIZED_WIRE_48),
	.clk_div500(SYNTHESIZED_WIRE_49),
	.clk_div250(SYNTHESIZED_WIRE_50),
	.clk_div125(SYNTHESIZED_WIRE_13),
	.state_in(SYNTHESIZED_WIRE_51),
	.col_g(col_green),
	.col_r(col_red),
	.row(row_control));


buzzerDriver	b2v_inst31(
	.clk_base(clock),
	.clk_ctr(SYNTHESIZED_WIRE_49),
	.state_in(SYNTHESIZED_WIRE_51),
	.buzz_out(buzz_out));


LEDdriver	b2v_inst32(
	.clk(SYNTHESIZED_WIRE_50),
	.sta(SYNTHESIZED_WIRE_51),
	.led(led));


numKeyAndSegDriver	b2v_inst34(
	.clkin(clock),
	.clk_div(SYNTHESIZED_WIRE_48),
	.cnt_u1(SYNTHESIZED_WIRE_20),
	.cnt_u2(SYNTHESIZED_WIRE_21),
	.cnt_u3(SYNTHESIZED_WIRE_22),
	.key_r(key_row),
	.state_in(SYNTHESIZED_WIRE_51),
	.cat(cat),
	.key_c(key_column),
	.numb(SYNTHESIZED_WIRE_8),
	.nums(SYNTHESIZED_WIRE_9),
	.seg(seg));


LCD1602driver	b2v_inst35(
	.LCD_Clk(clock),
	.YIMA_DATA1(SYNTHESIZED_WIRE_24),
	.YIMA_DATA10(SYNTHESIZED_WIRE_25),
	.YIMA_DATA11(SYNTHESIZED_WIRE_26),
	.YIMA_DATA12(SYNTHESIZED_WIRE_27),
	.YIMA_DATA2(SYNTHESIZED_WIRE_28),
	.YIMA_DATA3(SYNTHESIZED_WIRE_29),
	.YIMA_DATA4(SYNTHESIZED_WIRE_30),
	.YIMA_DATA5(SYNTHESIZED_WIRE_31),
	.YIMA_DATA6(SYNTHESIZED_WIRE_32),
	.YIMA_DATA7(SYNTHESIZED_WIRE_33),
	.YIMA_DATA8(SYNTHESIZED_WIRE_34),
	.YIMA_DATA9(SYNTHESIZED_WIRE_35),
	.LCD_RS(LCD_RS),
	.LCD_RW(LCD_RW),
	.LCD_EN(LCD_EN),
	.lcd_data(LCD_data));


LCDdecoder	b2v_inst36(
	.datain(SYNTHESIZED_WIRE_36),
	.dataout(SYNTHESIZED_WIRE_24));


LCDdecoder	b2v_inst37(
	.datain(SYNTHESIZED_WIRE_37),
	.dataout(SYNTHESIZED_WIRE_28));


LCDdecoder	b2v_inst38(
	.datain(SYNTHESIZED_WIRE_38),
	.dataout(SYNTHESIZED_WIRE_29));


LCDdecoder	b2v_inst39(
	.datain(SYNTHESIZED_WIRE_39),
	.dataout(SYNTHESIZED_WIRE_30));


freqDiv_20	b2v_inst4(
	.clk(clock),
	.clk_out(SYNTHESIZED_WIRE_0));


LCDdecoder	b2v_inst40(
	.datain(SYNTHESIZED_WIRE_40),
	.dataout(SYNTHESIZED_WIRE_31));


LCDdecoder	b2v_inst41(
	.datain(SYNTHESIZED_WIRE_41),
	.dataout(SYNTHESIZED_WIRE_32));


LCDdecoder	b2v_inst42(
	.datain(SYNTHESIZED_WIRE_42),
	.dataout(SYNTHESIZED_WIRE_33));


LCDdecoder	b2v_inst43(
	.datain(SYNTHESIZED_WIRE_43),
	.dataout(SYNTHESIZED_WIRE_34));


LCDdecoder	b2v_inst44(
	.datain(SYNTHESIZED_WIRE_44),
	.dataout(SYNTHESIZED_WIRE_35));


LCDdecoder	b2v_inst45(
	.datain(SYNTHESIZED_WIRE_45),
	.dataout(SYNTHESIZED_WIRE_25));


LCDdecoder	b2v_inst46(
	.datain(SYNTHESIZED_WIRE_46),
	.dataout(SYNTHESIZED_WIRE_26));


LCDdecoder	b2v_inst47(
	.datain(SYNTHESIZED_WIRE_47),
	.dataout(SYNTHESIZED_WIRE_27));


endmodule
