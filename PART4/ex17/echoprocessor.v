module processor (sysclk, data_valid, data_in, data_out);

	input				sysclk;		// system clock
	input				data_valid;
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire[9:0] echo;
	wire full;
	wire wrreq;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	reg rdreq;
	
	initial rdreq = 1'b0;
	
	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
		
   // This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
	
	FIFO fifo(sysclk, x, rdreq, wrreq, full, echo);
	pulse_gen pulseGen(sysclk, data_valid, wrreq);
	
	always @ (posedge sysclk)
	begin
		if(full == 1'b1 && wrreq == 1'b1)
			rdreq <= 1'b1;
		else
			rdreq <= 1'b0;
	end
	
	assign y = x + {echo[9], echo[9], echo[9:2]}; //Divide by 4 but keep the sign bit;
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	