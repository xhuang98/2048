module give_number (ctrl, CLOCK_50,stop, box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, boxe1, boxe2, boxe3,boxe4,boxe5,boxe6,boxe7,boxe8,boxe9,boxe10,boxe11,boxe12,boxe13,boxe14, boxe15, boxe16);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	input CLOCK_50;
	input stop;
	input [2:0] ctrl;
	wire random_select;
	wire other_select;
	wire [3:0] other_file;
	wire [63:0] st1;
	wire [63:0] current_state;
	reg [63:0] kuta;
	output [3:0] boxe1, boxe2, boxe3,boxe4,boxe5,boxe6,boxe7,boxe8,boxe9,boxe10,boxe11,boxe12,boxe13,boxe14, boxe15, boxe16;
	
	state_mux t1(.ctrl(ctrl), .CLOCK_50(CLOCK_50), .b1(box1), .b2(box2), .b3(box3),.b4(box4),.b5(box5),.b6(box6),.b7(box7),.b8(box8),.b9(box9),
	.b10(box10),.b11(box11),.b12(box12),.b13(box13),.b14(box14), .b15(box15), .b16(box16), .new_stated(st1));

	current_state c7(.box1(box1), .box2(box2), .box3(box3),.box4(box4),.box5(box5),.box6(box6),.box7(box7),.box8(box8),.box9(box9),
	.box10(box10),.box11(box11),.box12(box12),.box13(box13),.box14(box14), .box15(box15), .box16(box16), .wire_out(current_state));
	 
	 always@(posedge CLOCK_50)
		begin
			case(ctrl[2])
				0:begin
					kuta = current_state;
				  end
				1:begin
					kuta = st1;
					end
			endcase
		end
	state_decoder s2(.current_state(kuta), .box1(boxe1), .box2(boxe2), .box3(boxe3),.box4(boxe4),.box5(boxe5),.box6(boxe6),.box7(boxe7),.box8(boxe8),.box9(boxe9),
	.box10(boxe10),.box11(boxe11),.box12(boxe12),.box13(boxe13),.box14(boxe14), .box15(boxe15), .box16(boxe16));
	
endmodule
									
	 
	 
	
	



module state_decoder (current_state, box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16);
	input [63:0] current_state;
	reg [3:0] opt1, opt2, opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,opt11,opt12,opt13,opt14, opt15, opt16;	
	output [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	always@(*)
		begin
		opt1 = current_state[3:0];
		opt2 = current_state[7:4];	
		opt3 = current_state[11:8];
		opt4 = current_state[15:12];
		opt5 = current_state[19:16];
		opt6 = current_state[23:20];
		opt7 = current_state[27:24];
		opt8 = current_state[31:28];	
		opt9 = current_state[35:32];
		opt10 = current_state[39:36];
		opt11 = current_state[43:40];
		opt12 = current_state[47:44];
		opt13 = current_state[51:48];
		opt14 = current_state[55:52];
		opt15 = current_state[59:56];
		opt16 = current_state[63:60];
		end
	assign box1 = opt1; 
	assign box2 = opt2; 	
	assign box3 = opt3; 
	assign box4 = opt4; 
	assign box5 = opt5; 
	assign box6 = opt6; 
	assign box7 = opt7; 
	assign box8 = opt8; 
	assign box9 = opt9; 
	assign box10 = opt10; 
	assign box11 = opt11; 
	assign box12 = opt12; 
	assign box13 = opt13; 
	assign box14 = opt14; 
	assign box15 = opt15;
	assign box16 = opt16;
endmodule	

module state_mux(ctrl, CLOCK_50,b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16, new_stated);
	input [3:0] b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16;
	input CLOCK_50; 
	input [2:0] ctrl;
	wire [3:0] outvalue;
	wire [1:0] select;
	wire [3:0] other_file;
	wire random_select;
	wire other_select;
	wire [63:0] random_state;
	wire [63:0] first_state;
	wire [63:0] current_state;
	reg [63:0] stat;
	output [63:0] new_stated;
	
	t_ff T0( //toggle flip flops
	.enable(ctrl[0]), 
	.clock(CLOCK_50), 
	.reset(ctrl[1]),
	.q(outvalue)
	);	
	
	random_checker r0(.randombox(outvalue), .box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16), .muxy(random_select));
	
	other_checker o0(.box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16), .muxy(other_select), .next_option(other_file));
	
	current_state c0(.box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16), .wire_out(current_state));

	new_state c1(.box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16),.other_file(outvalue), .wire_out(random_state));

	new_state c2(.box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16),.other_file(other_file), .wire_out(first_state));
	
	assign select = {random_select, other_select};
	
	always@(posedge CLOCK_50)
		begin
			case(select)
				0: begin
					stat = current_state;
					end
				1: begin
					stat = first_state;
					end
				2:begin
					stat = current_state;
					end
				3: begin
					stat = random_state;
					end
			endcase
		end
	assign new_stated = stat;
endmodule

				
	 
	 


module current_state(box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, wire_out);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	output [63:0] wire_out;	
	assign wire_out = {box1,box2,box3, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16};
endmodule

module new_state (box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, other_file, wire_out);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	input [3:0] other_file;
	reg [63:0] current_wire;
	output [63:0] wire_out;

	
	always@(*)
	begin
		case(other_file)
			0: begin
				current_wire = {4'b0010, box2,box3, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			1: begin
				current_wire = {box1,4'b0010,box3, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			2: begin
				current_wire = {box1,box2,4'b0010, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			3: begin
				current_wire = {box1, box2,box3, 4'b0010,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			4: begin
				current_wire = {box1,box2,box3, box4,4'b0010,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			5: begin
				current_wire = {box1,box2,box3, box4,box5,4'b0010,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			6: begin
				current_wire = {box1, box2,box3, box4,box5,box6,4'b0010,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			7: begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,4'b0010,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
			8: begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,box8,4'b0010,box10,box11,box12,box13,box14,box15,box16} ;
				end
			9: begin
				current_wire = {box1, box2,box3, box4,box5,box6,box7,box8,box9,4'b0010, box11,box12,box13,box14,box15,box16} ;
				end
			10:begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,box8,box9,box10,4'b0010,box12,box13,box14,box15,box16} ;
				end
			11:begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,box8,box9,box10,box11,4'b0010,box13,box14,box15,box16} ;
				end	
			12:begin
				current_wire = {box1, box2,box3, box4,box5,box6,box7,box8,box9,box10, box11,box12,4'b0010,box14,box15,box16} ;
				end
			13:begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,4'b0010,box15, box16} ;
				end
			14:begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,4'b0010,box16} ;
				end						
			15:begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,4'b0010} ;
				end
			default: begin
				current_wire = {box1,box2,box3, box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16} ;
				end
		endcase
	end
	assign wire_out = current_wire; 
endmodule



	
module random_checker (randombox, box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, muxy);
	input [3:0] randombox,box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	reg q;
	output muxy;
	
	always@(*)
		begin
			case(randombox)
				0: begin
						if (box1 == 4'b0000)
						begin
							q = 1'b1;
						end
					end
				1: begin
						if (box2 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				2: begin
						if (box3 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				3: begin
						if (box4 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				4: begin
						if (box5 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				5: begin
						if (box6 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				6: begin
						if (box7 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				7: begin
						if (box8 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				8: begin
						if (box9 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				9: begin
						if (box10 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				10: begin
						if (box11 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				11: begin
						if (box12 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				12: begin
						if (box13 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				13: begin
						if (box14 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				14: begin
						if (box15 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				15: begin
						if (box16 == 4'b0000)
						begin
							q <= 1'b1;
						end
					end
				default: begin q = 1'b0; end
			endcase
		end
		assign muxy = q;
endmodule		
		
module other_checker (box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, muxy, next_option);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	reg q;
	reg [3:0] first_option;
	output muxy;
	output [3:0] next_option;
	always@(*)
		begin
			if (box1 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0000;
			end
			
			else if (box2 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0001;
			end
			
			else if (box3 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0010;
			end
			
			else if (box4 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0011;
			end
			
			else if (box5 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0100;
			end
			
			else if (box6 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0101;
			end
			
			else if (box7 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0110;
			end
			
			else if (box8 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b0111;
			end
			
			else if (box9 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1000;
			end
			
			else if (box10 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1001;
			end
			
			else if (box11 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1010;
			end
			
			else if (box12 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1011;
			end
			
			else if (box13 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1100;
			end
			
			else if (box14 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1101;
			end
			
			else if (box15 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1110;
			end
			
			else if (box16 == 4'b0000)
			begin
				q <= 1'b1;
				first_option <= 4'b1111;
			end
		end
		assign next_option[3:0] = first_option;
		assign muxy = q;
endmodule

module variable_counter(ctrl, CLOCK_50, d);
    input [2:0] ctrl;
    input CLOCK_50;
    
    wire enable;
    wire [3:0] outvalue;
	 output reg [3:0] d;
    
    t_ff T0( //toggle flip flops
       .enable(ctrl[0]), 
       .clock(CLOCK_50), 
       .reset(ctrl[1]),
       .q(outvalue)
       );
	always @(posedge CLOCK_50)
	begin
		if (ctrl[1] == 1'b1)
		begin
			d <= 0;
		end
		else if (ctrl[2] == 1'b1 && ctrl[0] == 1'b1)
		begin
			d <= outvalue;
		end
		else
		begin
			d <= d;
		end
	end

endmodule

module t_ff(enable, clock, reset, q);
    input enable, clock, reset;
    output reg [3:0] q;

    always @(posedge clock)
    begin
        if(reset == 1'b1) //reset when high
        begin
            q <= 0;
        end
        else if(q > 4'b1111) //when hex display reaches F reset
            q <= 0;
        else if(enable == 1'b1) //counts upwards for hex value
            q <= q + 1;
    end
endmodule
			
						