module clktick_16(
clkin,
tick);

	parameter N_BIT = 16;
	parameter N = 49999;
	
	input clkin;
	output tick;
	
	reg [N_BIT-1:0] count;
	reg tick;
	
	initial tick = 1'b0;
	initial count = 16'b0;
	
	always @ (posedge clkin)
	begin
		if (count == 0)
		begin
			tick <= 1'b1;
			count <= N;
		end
		else
		begin
			tick <= 1'b0;
			count  <= count + 1'b1;
		end
	end
		
endmodule
