module ex_10_top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK
);

	input [9:0] SW;
	input CLOCK_50;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK;

	wire TICK_10KHz;
	
	clktick_16 OBJ1(CLOCK_50, TICK_10KHz, 16'd5000, 1'b1);

	spi2dac OBJ2(CLOCK_50, SW, TICK_10KHz, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

endmodule
