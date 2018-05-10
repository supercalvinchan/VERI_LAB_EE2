module delay(N, clk, trigger, time_out);

	input [15:0] N;
	input clk;
	input trigger;
	
	output time_out;
	
	reg [15:0] count;
	reg time_out;
	
	initial count = 16'b0;
	initial time_out = 1'b0;
	
	always @ (posedge clk)
	begin
		if(trigger == 1'b1)
		begin
			if(count == N)
				time_out <= 1'b1;
			else
				count <= count + 1'b1;
		end
		else
		begin
			count <= 0;
			time_out <= 0;
		end
	end	

endmodule
