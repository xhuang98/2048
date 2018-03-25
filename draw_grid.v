module draw_grid(reset, clock, values, x, y, colour);
	input [16*4 - 1: 0] values; // all values in order
	input clock, reset;
	output [6:0] x, y; // x: 57-123; y: 27-93.
	output [2:0] colour; // white (111) for numbers, red (100) for box
	wire [3:0] boxcount, xcount, ycount;
	reg clock_box;
	reg [4:0] value;
	
	always @(*)
	begin
		case(boxcount)
		4'b0000: value <= values[(4'b0000 + 1'b1) * 1'd4: 4'b0000 * 1'd4];
		4'b0001: value <= values[(4'b0001 + 1'b1) * 1'd4: 4'b0001 * 1'd4];
		4'b0010: value <= values[(4'b0010 + 1'b1) * 1'd4: 4'b0010 * 1'd4];
		4'b0011: value <= values[(4'b0011 + 1'b1) * 1'd4: 4'b0011 * 1'd4];
		4'b0100: value <= values[(4'b0100 + 1'b1) * 1'd4: 4'b0100 * 1'd4];
		4'b0101: value <= values[(4'b0101 + 1'b1) * 1'd4: 4'b0101 * 1'd4];
		4'b0110: value <= values[(4'b0110 + 1'b1) * 1'd4: 4'b0110 * 1'd4];
		4'b0111: value <= values[(4'b0111 + 1'b1) * 1'd4: 4'b0111 * 1'd4];
		4'b1000: value <= values[(4'b1000 + 1'b1) * 1'd4: 4'b1000 * 1'd4];
		4'b1001: value <= values[(4'b1001 + 1'b1) * 1'd4: 4'b1001 * 1'd4];
		4'b1010: value <= values[(4'b1010 + 1'b1) * 1'd4: 4'b1010 * 1'd4];
		4'b1011: value <= values[(4'b1011 + 1'b1) * 1'd4: 4'b1011 * 1'd4];
		4'b1100: value <= values[(4'b1100 + 1'b1) * 1'd4: 4'b1100 * 1'd4];
		4'b1101: value <= values[(4'b1101 + 1'b1) * 1'd4: 4'b1101 * 1'd4];
		4'b1110: value <= values[(4'b1110 + 1'b1) * 1'd4: 4'b1110 * 1'd4];
		4'b1111: value <= values[(4'b1111 + 1'b1) * 1'd4: 4'b1111 * 1'd4];
		endcase
	end
	
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
	output reg [2:0] colour;// white (111) for numbers, red (100) for box?
	
	always@(*)
	// assigning colour to each box
	begin
		case(value)
			4'b0000: 
				colour <= 3'b100;
			4'b0001:
				if(((xcount == 1'd7 || xcount == 1'd8 || xcount == 1'd9 || xcount == 2'd10) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) || 
					(xcount == 1'd7 && ycount == 1'd9) || (xcount == 2'd10 && ycount == 1'd7))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0010:
				if((xcount == 2'd10 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					(xcount == 1'd7 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8)) || ((xcount == 1'd8 || xcount == 1'd9) && ycount == 1'd8))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0011:
				if(((xcount == 1'd7 || xcount == 2'd10) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) ||
					((xcount == 1'd8 || xcount == 1'd9) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0100:
				if(((xcount == 1'd7 || xcount == 1'd9) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					(xcount == 2'd10 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) || 
					(xcount == 2'd11 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0101:
				if(((xcount == 1'd5 || xcount == 1'd6 || xcount == 2'd10) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) || 
					(xcount == 1'd7 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					(xcount == 1'd9 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) ||
					(xcount == 1'd11 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 2'd10)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0110:
				if(((xcount == 1'd5 || xcount == 2'd11) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) ||
					(xcount == 1'd6 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) || 
					(xcount == 1'd7 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					(xcount == 1'd9 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8)) || 
					(xcount == 2'd10 && ycount == 1'd8))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0111:
				if(((xcount == 1'd3 || xcount == 2'd10 || xcount == 2'd13) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					(xcount == 1'd5 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					(xcount == 1'd8 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 2'd10)) || 
					((xcount == 1'd6 || xcount == 1'd7 || xcount == 2'd11 || xcount == 2'd12) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1000:
				if(((xcount == 1'd3 || xcount == 1'd4 || xcount == 1'd8 || xcount == 1'd9 || xcount == 2'd13 || xcount == 2'd14) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) || 
					((xcount == 1'd2 || xcount == 2'd10 || xcount == 2'd15) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					((xcount == 1'd5 || xcount == 1'd7) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 2'd10)) || 
					(xcount == 2'd12 || (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1001:
				if(((xcount == 1'd3 || xcount == 1'd4 || xcount == 2'd13 || xcount == 2'd14) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) ||
					(xcount == 1'd9 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					((xcount == 1'd2 || xcount == 2'd15) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					((xcount == 1'd5 || xcount == 2'd12) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1010:
				if(((xcount == 1'd2 || xcount == 1'd4 || xcount == 1'd6 || xcount == 2'd14) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || 
					(xcount == 1'd5 && (ycount == 1'd6 || ycount == 2'd10)) || (xcount == 1'd8 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) ||
					(xcount == 1'd9 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) || (xcount == 2'd10 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 2'd10)) ||
					(xcount == 2'd12 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8)) || (xcount == 2'd13 && ycount == 1'd8))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1011:
				if((xcount == 1'd1 && (ycount == 1'd6 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) || ((xcount == 1'd2 || xcount == 2'd14) && (ycount == 1'd6 || ycount == 1'd8 || ycount == 2'd10)) ||
					(xcount == 1'd3 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 2'd10)) ||
					((xcount == 1'd5 || xcount == 1'd7 || xcount == 2'd11 || xcount == 2'd13 || xcount == 2'd15) && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8 || ycount == 1'd9 || ycount == 2'd10)) ||
					(xcount == 1'd9 && (ycount == 1'd6 || ycount == 1'd7 || ycount == 1'd8)) || (xcount == 2'd10 && ycount == 1'd8))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			default: 
				colour <= 3'b110; // error
		endcase
	
		case(boxcount)
			4'b0000:
			begin
				X <= xcount + 2'd57;
				Y <= ycount + 2'd27;
			end
			4'b0001:
			begin
				X <= xcount + 2'd74;
				Y <= ycount + 2'd27;
			end
			4'b0010:
			begin
				X <= xcount + 2'd91;
				Y <= ycount + 2'd27;
			end
			4'b0011:
			begin	
				X <= xcount + 3'd108;
				Y <= ycount + 2'd27;
			end
			4'b0100:
			begin	
				X <= xcount + 2'd57;
				Y <= ycount + 2'd44;
			end
			4'b0101:
			begin	
				X <= xcount + 2'd74;
				Y <= ycount + 2'd44;
			end
			4'b0110:
			begin	
				X <= xcount + 2'd91;
				Y <= ycount + 2'd44;
			end
			4'b0111:
			begin
				X <= xcount + 3'd108;
				Y <= ycount + 2'd44;
			end
			4'b1000:
			begin	
				X <= xcount + 2'd57;
				Y <= ycount + 2'd61;
			end
			4'b1001:
			begin	
				X <= xcount + 2'd74;
				Y <= ycount + 2'd61;
			end
			4'b1010:
			begin	
				X <= xcount + 2'd91;
				Y <= ycount + 2'd61;
			end
			4'b1011:
			begin	
				X <= xcount + 3'd108;
				Y <= ycount + 2'd61;
			end
			4'b1100:
			begin	
				X <= xcount + 2'd57;
				Y <= ycount + 2'd78;
			end
			4'b1101:
			begin	
				X <= xcount + 2'd74;
				Y <= ycount + 2'd78;
			end
			4'b1110:
			begin	
				X <= xcount + 2'd91;
				Y <= ycount + 2'd78;
			end
			4'b1111:
			begin
				X <= xcount + 3'd108;
				Y <= ycount + 2'd78;
			end
		endcase
	end
endmodule