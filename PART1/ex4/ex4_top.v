module ex4_top(SW, HEX0, HEX1, HEX2, HEX3, HEX4);

	input [9:0] SW;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;
	
	wire [3:0] BCD0;
	wire [3:0] BCD1;
	wire [3:0] BCD2;
	wire [3:0] BCD3;
	//wire [3:0] BCD4;
	
	
	
	bin2bcd_10 SEG0(SW[9:0], BCD0[3:0], BCD1[3:0], BCD2[3:0], BCD3[3:0]);
	
	hex_to_7seg SEG1(HEX0[6:0], BCD0[3:0]);
	hex_to_7seg SEG2(HEX1[6:0], BCD1[3:0]);
	hex_to_7seg SEG3(HEX2[6:0], BCD2[3:0]);
	hex_to_7seg SEG4(HEX3[6:0], BCD3[3:0]);
	hex_to_7seg SEG5(HEX4[6:0], 4'b0);
	
endmodule
	

