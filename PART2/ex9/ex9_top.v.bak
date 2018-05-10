module ex8_top(
CLOCK_50,
KEY,
HEX0,
HEX1,
HEX2,
HEX3,
HEX4,
LEDR);

	input CLOCK_50;
	input [3:0] KEY;
	
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	output [9:0] LEDR;
	
	wire CLOCK_1MS, TICK_500MS;
	wire time_out;
	wire en_lfsr, start_delay;
	wire [5:0] RANDOM;
	wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
	
	clkdiv_16 DIV0(CLOCK_50, CLOCK_1MS, 16'd50000, 1'b1);
	clktick_16 TICK0(CLOCK_1MS, TICK_500MS, 16'd500, 1'b1);
	LFSR_6 LFSR(en_lfsr, CLOCK_1MS, RANDOM);
	
	ex8_fsm FSM(CLOCK_1MS, TICK_500MS, ~KEY[3], time_out, en_lfsr, start_delay, LEDR[9:0]);
	
	delay D0((RANDOM * 250), CLOCK_1MS, start_delay, time_out);
	
	bin2bcd_16 BIN2BCD((RANDOM * 250), BCD0, BCD1, BCD2, BCD3, BCD4);
	hex_to_7seg SG0(HEX0, BCD0);
	hex_to_7seg SG1(HEX1, BCD1);
	hex_to_7seg SG2(HEX2, BCD2);
	hex_to_7seg SG3(HEX3, BCD3);
	hex_to_7seg SG4(HEX4, BCD4);
	
endmodule
	
