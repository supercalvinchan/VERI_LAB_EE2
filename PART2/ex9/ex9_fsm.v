module ex9_fsm(
clk,
tick,
trigger,
time_out,
en_lfsr,
start_delay,
ledr,
reaction,
en_counter,
reset_counter);

	input clk, tick, trigger, time_out, reaction;
	output en_lfsr, start_delay, en_counter, reset_counter;
	output [9:0] ledr;
	
	parameter NSTATE = 13;
	
	parameter WAIT = 13'b0000000000001;
	parameter COUNT0 = 13'b0000000000010;
	parameter COUNT1 = 13'b0000000000100;
	parameter COUNT2 = 13'b0000000001000;
	parameter COUNT3 = 13'b0000000010000;
	parameter COUNT4 = 13'b0000000100000;
	parameter COUNT5 = 13'b0000001000000;
	parameter COUNT6 = 13'b0000010000000;
	parameter COUNT7 = 13'b0000100000000;
	parameter COUNT8 = 13'b0001000000000;
	parameter COUNT9 = 13'b0010000000000;
	parameter COUNT10 = 13'b0100000000000;
	parameter WAIT_REACTION = 13'b1000000000000;
	
	reg [NSTATE-1:0] state;
	reg en_lfsr, start_delay, en_counter, reset_counter;
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
			COUNT10: if(time_out == 1'b1) state <= WAIT_REACTION;
			WAIT_REACTION: if(reaction == 1'b1) state <= WAIT;
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
					en_counter <= 1'b0;
					reset_counter <= 1'b0;
					end
			COUNT0: 	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b0000000000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT1:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1000000000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT2:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1100000000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT3:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1110000000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT4:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111000000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT5:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111100000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT6:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111110000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT7:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111111000;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT8:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111111100;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT9:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b0;
						ledr <= 10'b1111111110;
						en_counter <= 1'b0;
						reset_counter <= 1'b0;
						end
			COUNT10:	begin
						en_lfsr <= 1'b0;
						start_delay <= 1'b1;
						ledr <= 10'b1111111111;
						en_counter <= 1'b0;
						reset_counter <= 1'b1;
						end
			WAIT_REACTION: begin
								en_lfsr <= 1'b0;
								start_delay <= 1'b0;
								ledr <= 10'b0000000000;
								reset_counter <= 1'b0;
								en_counter <= 1'b1;
								end
			default: ; //do nothing
		endcase
	end
		
endmodule
						
						
	
	