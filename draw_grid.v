module draw_grid(reset, clock, values, x, y, colour);
	input [16*4 - 1: 0] values; // all values in order
	input clock, reset;
	output reg [6:0] x, y; // x: 57-123; y: 27-93.
	output reg [2:0] colour; // white (111) for numbers, red (100) for box?
	wire reg [3:0] boxcount, xcount, ycount;
	wire clock_box;
	wire reg [4:0] value;
	
	assign value = values[(boxcount + 1) * 4: boxcount * 4];
	
	//counterBox counts from 0 to 15
	counterBox c0(clock_box, reset, 1'b1, boxcount);
	always @(posedge clock)
	begin
		if (xcount == 4'b1110 && ycount == 4'b1110)
			clock_box <= 1'b1;
		else
			clock_box <= 1'b0;
	end
	
	//counterX counts from 0 to 14
	counterX c1(clock, reset, 1'b1, xcount);
	//counterY counts from 0 to 14
	counterY c2(clock, reset, 1'b1, ycount);

	analyze a0(value, xcount, ycount, boxcount, x, y, colour);
endmodule

module counterX(clock, reset, enable, q);
		input clock;
		input reset;
		input enable;
		output reg [3:0] q;
		
		always @(posedge clock)
		begin
			if(reset_n == 1'b1)
				q <= 4'b0000;
			else if(enable == 1'b1)
			begin
			   if ( q == 4'b1110 )
					q <= 4'b0000;
				else
					q <= q + 1'b1;
			end
		end
endmodule	

module counterY(clock, reset, enable, q);
		input clock;
		input reset;
		input enable;
		output reg [3:0] q;
		
		always @(posedge clock)
		begin
			if(reset == 1'b1)
				q <= 4'b0000;
			else if(enable == 1'b1)
			begin
			   if ( q == 4'b1110 )
					q <= 4'b0000;
				else
					q <= q + 1'b1;
			end
		end
endmodule	

module counterBox(clock, reset, enable, q);
		input clock;
		input reset;
		input enable;
		output reg [3:0] q;
		
		always @(posedge clock)
		begin
			if(reset == 1'b1)
				q <= 4'b0000;
			else if(enable == 1'b1)
			begin
			   if ( q == 4'b1111 )
					q <= 4'b0000;
				else
					q <= q + 1'b1;
			end
		end
endmodule	

module analyze(value, xcount, ycount, boxcount, X, Y, colour);
	input [3: 0] value;
	input [3:0] xcount, ycount, boxcount;
	output reg [6:0] X, Y;
	output reg [2:0] colour;
	wire mode;
	
	always@(*)
	begin
		
	end
	
	
	
	
	
	
	
	
endmodule