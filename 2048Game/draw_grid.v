module draw_grid(reset, clock, values, x, y, colour);
	input [16*4 - 1: 0] values; // box1 - box16 all values in order 
	input clock, reset;
	output [6:0] x, y; // x: 57-123; y: 27-93.
	output [2:0] colour; // white (111) for numbers, red (100) for box
	wire [3:0] boxcount, xcount, ycount;
	reg clock_box;
	reg [4:0] value;
	reg clock_y;
	
	always @(*)
	begin
		case(boxcount)
		/*
		
		4'b0000: value <= values[(4'b0000 + 1'b1) * 4: 4'b0000 * 4];
		4'b0001: value <= values[(4'b0001 + 1'b1) * 4: 4'b0001 * 4];
		4'b0010: value <= values[(4'b0010 + 1'b1) * 4: 4'b0010 * 4];
		4'b0011: value <= values[(4'b0011 + 1'b1) * 4: 4'b0011 * 4];
		4'b0100: value <= values[(4'b0100 + 1'b1) * 4: 4'b0100 * 4];
		4'b0101: value <= values[(4'b0101 + 1'b1) * 4: 4'b0101 * 4];
		4'b0110: value <= values[(4'b0110 + 1'b1) * 4: 4'b0110 * 4];
		4'b0111: value <= values[(4'b0111 + 1'b1) * 4: 4'b0111 * 4];
		4'b1000: value <= values[(4'b1000 + 1'b1) * 4: 4'b1000 * 4];
		4'b1001: value <= values[(4'b1001 + 1'b1) * 4: 4'b1001 * 4];
		4'b1010: value <= values[(4'b1010 + 1'b1) * 4: 4'b1010 * 4];
		4'b1011: value <= values[(4'b1011 + 1'b1) * 4: 4'b1011 * 4];
		4'b1100: value <= values[(4'b1100 + 1'b1) * 4: 4'b1100 * 4];
		4'b1101: value <= values[(4'b1101 + 1'b1) * 4: 4'b1101 * 4];
		4'b1110: value <= values[(4'b1110 + 1'b1) * 4: 4'b1110 * 4];
		4'b1111: value <= values[(4'b1111 + 1'b1) * 4: 4'b1111 * 4];*/
		4'b0000: value <= values[63: 60];
		4'b0001: value <= values[59: 56];
		4'b0010: value <= values[55: 52];
		4'b0011: value <= values[51: 48];
		4'b0100: value <= values[47: 44];
		4'b0101: value <= values[43: 40];
		4'b0110: value <= values[39: 36];
		4'b0111: value <= values[35: 32];
		4'b1000: value <= values[31: 28];
		4'b1001: value <= values[27: 24];
		4'b1010: value <= values[23: 20];
		4'b1011: value <= values[19: 16];
		4'b1100: value <= values[15: 12];
		4'b1101: value <= values[11: 8];
		4'b1110: value <= values[7: 4];
		4'b1111: value <= values[3: 0];
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
	
	always@(*)
	begin
		if(xcount ==  4'b1110)
			clock_y = 1'b1;
		else
			clock_y = 1'b0;
	end
	
	//counterX counts from 1 to 15
	counterX c1(clock, reset, 1'b1, xcount);
	//counterY counts from 0 to 14
	counterY c2(clock_y, reset, 1'b1, ycount);

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
				q <= 4'b0001;
			else if(enable == 1'b1)
			begin
			   if ( q == 4'b1111 )
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
				if(((xcount == 4'b0111 || xcount ==  4'b1000 || xcount ==  4'b1001 || xcount ==  4'b1010) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					(xcount ==  4'b0111 && ycount ==  4'b1001) || (xcount ==  4'b1010 && ycount ==  4'b0111))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0010:
				if((xcount ==  4'b1010 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					(xcount ==  4'b0111 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000)) || ((xcount ==  4'b1000 || xcount ==  4'b1001) && ycount ==  4'b1000))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0011:
				if(((xcount ==  4'b0111 || xcount ==  4'b1010) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) ||
					((xcount ==  4'b1000 || xcount ==  4'b1001) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0100:
				if(((xcount ==  4'b0111 || xcount ==  4'b1001) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					(xcount ==  4'b1010 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					(xcount ==  4'b1011 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0101:
				if(((xcount == 4'b0101 || xcount == 4'b0110 || xcount ==  4'b1010) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					(xcount ==  4'b0111 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					(xcount ==  4'b1001 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) ||
					(xcount == 4'b1011 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1010)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0110:
				if(((xcount == 4'b0101 || xcount ==  4'b1011) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) ||
					(xcount == 4'b0110 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					(xcount ==  4'b0111 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					(xcount ==  4'b1001 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000)) || 
					(xcount ==  4'b1010 && ycount ==  4'b1000))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b0111:
				if(((xcount == 4'b0011 || xcount ==  4'b1010 || xcount ==  4'b1101) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					(xcount == 4'b0101 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					(xcount ==  4'b1000 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					((xcount == 4'b0110 || xcount ==  4'b0111 || xcount ==  4'b1011 || xcount ==  4'b1100) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1000:
				if(((xcount == 4'b0011 || xcount == 4'b0100 || xcount ==  4'b1000 || xcount ==  4'b1001 || xcount ==  4'b1101 || xcount ==  4'b1110) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					((xcount == 4'b0010 || xcount ==  4'b1010 || xcount ==  4'b1111) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					((xcount == 4'b0101 || xcount ==  4'b0111) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					(xcount ==  4'b1100 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1001:
				if(((xcount == 4'b0011 || xcount == 4'b0100 || xcount ==  4'b1101 || xcount ==  4'b1110) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) ||
					(xcount ==  4'b1001 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					((xcount == 4'b0010 || xcount ==  4'b1111) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1010)) || 
					((xcount == 4'b0101 || xcount ==  4'b1100) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1010:
				if(((xcount == 4'b0010 || xcount == 4'b0100 || xcount == 4'b0110 || xcount ==  4'b1110) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || 
					(xcount == 4'b0101 && (ycount == 4'b0110 || ycount ==  4'b1010)) || (xcount ==  4'b1000 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) ||
					(xcount ==  4'b1001 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) || (xcount ==  4'b1010 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1010)) ||
					(xcount ==  4'b1100 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000)) || (xcount ==  4'b1101 && ycount ==  4'b1000))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			4'b1011:
				if((xcount == 4'b0001 && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) || ((xcount == 4'b0010 || xcount ==  4'b1110) && (ycount == 4'b0110 || ycount ==  4'b1000 || ycount ==  4'b1010)) ||
					(xcount == 4'b0011 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1010)) ||
					((xcount == 4'b0101 || xcount ==  4'b0111 || xcount ==  4'b1011 || xcount ==  4'b1101 || xcount ==  4'b1111) && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000 || ycount ==  4'b1001 || ycount ==  4'b1010)) ||
					(xcount ==  4'b1001 && (ycount == 4'b0110 || ycount ==  4'b0111 || ycount ==  4'b1000)) || (xcount ==  4'b1010 && ycount ==  4'b1000) ||
					(xcount == 4'b0110 && (ycount == 4'b0110 || ycount ==  4'b1010)))
					colour <= 3'b111;
				else
					colour <= 3'b100;
			default: 
				colour <= 3'b110; // error
		endcase
	end
	
	always@(*)
	begin
		case(boxcount)
			4'b0000:
			begin
				X <= xcount + 6'b111001;
				Y <= ycount + 5'b11011;
			end
			4'b0001:
			begin
				X <= xcount + 7'b1001010;
				Y <= ycount + 5'b11011;
			end
			4'b0010:
			begin
				X <= xcount + 7'b1011011;
				Y <= ycount + 5'b11011;
			end
			4'b0011:
			begin	
				X <= xcount + 7'b1101100;
				Y <= ycount + 5'b11011;
			end
			4'b0100:
			begin	
				X <= xcount + 6'b111001;
				Y <= ycount + 6'b101100;
			end
			4'b0101:
			begin	
				X <= xcount + 7'b1001010;
				Y <= ycount + 6'b101100;
			end
			4'b0110:
			begin	
				X <= xcount + 7'b1011011;
				Y <= ycount + 6'b101100;
			end
			4'b0111:
			begin
				X <= xcount + 7'b1101100;
				Y <= ycount + 6'b101100;
			end
			4'b1000:
			begin	
				X <= xcount + 6'b111001;
				Y <= ycount + 6'b111101;
			end
			4'b1001:
			begin	
				X <= xcount + 7'b1001010;
				Y <= ycount + 6'b111101;
			end
			4'b1010:
			begin	
				X <= xcount + 7'b1011011;
				Y <= ycount + 6'b111101;
			end
			4'b1011:
			begin	
				X <= xcount + 7'b1101100;
				Y <= ycount + 6'b111101;
			end
			4'b1100:
			begin	
				X <= xcount + 6'b111001;
				Y <= ycount + 7'b1001110;
			end
			4'b1101:
			begin	
				X <= xcount + 7'b1001010;
				Y <= ycount + 7'b1001110;
			end
			4'b1110:
			begin	
				X <= xcount + 7'b1011011;
				Y <= ycount + 7'b1001110;
			end
			4'b1111:
			begin
				X <= xcount + 7'b1101100;
				Y <= ycount + 7'b1001110;
			end
		endcase
	end
endmodule