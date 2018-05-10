module ex6_top(
	KEY,
	CLOCK_50,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4
);

	input [1:0] KEY;
	input CLOCK_50;

	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;

	wire [15:0] count;
	wire tick, enable;
	
	wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
	
	
	counter_16 COUNTER(CLOCK_50, enable, ~KEY[1], count[15:0]);
	
	clktick_16 TICKER(CLOCK_50, tick);
	
	bin2bcd_16 BIN2BCD(count, BCD0, BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg HEX_TO_7SEG1(HEX0, BCD0);
	hex_to_7seg HEX_TO_7SEG2(HEX1, BCD1);
	hex_to_7seg HEX_TO_7SEG3(HEX2, BCD2);
	hex_to_7seg HEX_TO_7SEG4(HEX3, BCD3);
	hex_to_7seg HEX_TO_7SEG5(HEX4, BCD4);
	
	assign enable = (tick & ~KEY[0]);
	
endmodule
	