module ex8_fsm(
clk,
tick,
trigger,
time_out,
en_lfsr,
start_delay,
ledr);

	input clk, tick, trigger, time_out;
	output en_lfsr, start_delay;
	output [9:0] ledr;
	
	parameter NSTATE = 12;
	
	parameter WAIT = 12'b000000000001;
	parameter COUNT0 = 12'b000000000010;
	parameter COUNT1 = 12'b000000000100;
	parameter COUNT2 = 12'b000000001000;
	parameter COUNT3 = 12'b000000010000;
	parameter COUNT4 = 12'b000000100000;
	parameter COUNT5 = 12'b000001000000;
	parameter COUNT6 = 12'b000010000000;
	parameter COUNT7 = 12'b000100000000;
	parameter COUNT8 = 12'b001000000000;
	parameter COUNT9 = 12'b010000000000;
	parameter COUNT10 = 12'b100000000000;
	
	reg [NSTATE-1:0] state;
	reg en_lfsr, start_delay;
	reg [9:0] ledr;
	
	initial state = WAIT;
	initial en_lfsr = 1'b0;
	initial start_delay = 1'b0;
	
	//state transitions
	always @ (posedge clk)
	begin
		case (state)
			WAIT: if(trigger == 1'b1) state <= COUNT0;
			//Should we check trigger == 0 here?
			COUNT0: if(tick == 1'b1) state <= COUNT1;
			COUNT1: if(tick == 1'b1) state <= COUNT2;
			COUNT2: if(tick == 1'b1) state <= COUNT3;
			COUNT3: if(tick == 1'b1) state <= COUNT4;
			COUNT4: if(tick == 1'b1) state <= COUNT5;
			COUNT5: if(tick == 1'b1) state <= COUNT6;
			COUNT6: if(tick == 1'b1) state <= COUNT7;
			COUNT7: if(tick == 1'b1) state <= COUNT8;
			COUNT8: if(tick == 1'b1) state <= COUNT9;
			COUNT9: if(tick == 1'b1) state <= COUNT10;
			COUNT10: if(time_out == 1'b1) state <= WAIT;
			default: ; //do nothing
		endcase
	end
	
	//ouput combinational logic
	always @ (*)
	begin
		case (state)
			WAIT: begin
					en_lfsr <= 1'b1;
					start_delay <= 1'b0;
					ledr <= 10'b0000000000;
					end
			COUNT0: 	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b0000000000;
						end
			COUNT1:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1000000000;
						end
			COUNT2:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1100000000;
						end
			COUNT3:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1110000000;
						end
			COUNT4:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111000000;
						end
			COUNT5:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111100000;
						end
			COUNT6:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111110000;
						end
			COUNT7:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111111000;
						end
			COUNT8:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111111100;
						end
			COUNT9:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111111110;
						end
			COUNT10:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b1;
						ledr <= 10'b1111111111;
						end
			default: ; //do nothing
		endcase
	end
		
endmodule
						
						
	
	