module box(data, enable, reset, clock, value);
	input enable, clock, reset;
	input [3:0] data;
	output reg [3:0] value;
	
	always @(posedge clock or posedge reset)
	begin
		if(reset == 1)
		begin
			value <= 0;
		end
		else
		begin
			value <= data;
		end
	end
endmodule