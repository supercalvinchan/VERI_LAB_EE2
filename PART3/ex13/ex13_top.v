module ex13_top(CLOCK_50, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD, PWM_OUT);

	input CLOCK_50;
	output DAC_SDI, DAC_CS, DAC_SCK, DAC_LD, PWM_OUT;
	
	wire TICK_10KHz;
	wire [9:0] DATA;
	wire [9:0] count;
	
	reg reset_counter;
	
	initial reset_counter = 1'b0;
	
	clktick_16 OBJ1(CLOCK_50, TICK_10KHz, 16'd5000, 1'b1);
	
	counter_16 OBJ2(CLOCK_50, TICK_10KHz, reset_counter, count);
	ROM OBJ3(count, TICK_10KHz, DATA);
	
	spi2dac OBJ4(CLOCK_50, DATA, TICK_10KHz, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm OBJ5(CLOCK_50, DATA, TICK_10KHz, PWM_OUT);
	
	always @ (posedge CLOCK_50)
	begin
		if(count == 16'd1023)
			reset_counter <= 1'b1;
		else
			reset_counter <= 1'b0;
	end
	
	endmodule
	
	