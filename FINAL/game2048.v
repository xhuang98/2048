module game2048(
		// TODO: add keyboard
		LEDR,
		HEX0,
		HEX1,
		KEY,
		SW,							// temporary input
		CLOCK_50,
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   						//	VGA Blue[9:0]	
		);
	//input: arrow keys, s key (start)
	input			CLOCK_50;				//	50 MHz
	input 	[1:0]	SW;					// SW0 is start, SW1 is reset
	input [3:0] KEY;						// KEY[3:0] is direction (up, down, left, right)
	
	output [1:0] LEDR;
	output [6:0] HEX0, HEX1;			// HEX0 is current state, HEX1 is next state
	//output: vga stuff:
	output			VGA_CLK;   				//	VGA Clock      
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	/*============ VGA Adapter =============*/
	vga_adapter VGA(
		.resetn(~reset),
		.clock(CLOCK_50),
		.colour(colour),
		.x(x),
		.y(y),
		.plot(1'b1), // Should I?
		/* Signals for the DAC to drive the monitor. */
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.VGA_HS(VGA_HS),
		.VGA_VS(VGA_VS),
		.VGA_BLANK(VGA_BLANK_N),
		.VGA_SYNC(VGA_SYNC_N),
		.VGA_CLK(VGA_CLK));
	defparam VGA.RESOLUTION = "160x120";
	defparam VGA.MONOCHROME = "FALSE";
	
	
	defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	defparam VGA.BACKGROUND_IMAGE = "black.mif";
	
	/*======================================*/
	
	wire start, reset, reset_boxes;
	wire [16 * 4 - 1 : 0] newvalues;
	wire [16 * 4 - 1 : 0] oldvalues;
	wire [3:0] box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in;
	wire [3:0] box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, box10out, box11out, box12out, box13out, box14out, box15out, box16out;
	wire enable, clock;
	wire [1:0] endstatus;
	reg [3:0] direction;
	reg reset_n;
	wire [6:0] x, y; // x: 57-123; y: 27-93.
	wire [2:0] colour; // white (111) for numbers, red (100) for box
	wire [2:0] state, n_state;
	
	// TODO: Assign keyboard to start
	assign start = SW[0];
	assign reset = SW[1];
	
	assign reset_boxes = start | reset;
	
	clockdelay2 c2(reset, CLOCK_50, clock);
	//assign clock = CLOCK_50;
	

	// TODO: Assign keyboard values to direction
	always@(posedge ~KEY[0] or posedge ~KEY[1] or posedge ~KEY[2] or posedge ~KEY[3])
		begin
		direction <= ~KEY[3:0];
		end
	
	
	// start or reset reset boxes
	box	b1(box1in, enable, reset_boxes, clock, box1out);
	box	b2(box2in, enable, reset_boxes, clock, box2out);
	box	b3(box3in, enable, reset_boxes, clock, box3out);
	box	b4(box4in, enable, reset_boxes, clock, box4out);
	box	b5(box5in, enable, reset_boxes, clock, box5out);
	box	b6(box6in, enable, reset_boxes, clock, box6out);
	box	b7(box7in, enable, reset_boxes, clock, box7out);
	box	b8(box8in, enable, reset_boxes, clock, box8out);
	box	b9(box9in, enable, reset_boxes, clock, box9out);
	box	b10(box10in, enable, reset_boxes, clock, box10out);
	box	b11(box11in, enable, reset_boxes, clock, box11out);
	box	b12(box12in, enable, reset_boxes, clock, box12out);
	box	b13(box13in, enable, reset_boxes, clock, box13out);
	box	b14(box14in, enable, reset_boxes, clock, box14out);
	box	b15(box15in, enable, reset_boxes, clock, box15out);
	box	b16(box16in, enable, reset_boxes, clock, box16out);
		
	assign {box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in} = newvalues;
	assign oldvalues = {box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, box10out, box11out, box12out, box13out, box14out, box15out, box16out};
	
	control c0(reset, start, clock, direction, oldvalues, enable, newvalues, endstatus, state, n_state); 
	
	draw_grid d0(start, CLOCK_50, oldvalues, x, y, colour);
	
	//resultdisplay r0(endstatus, x, y, colour);
	assign LEDR[1:0] = endstatus;
	
	hex_decoder h0({1'b0,state}, HEX0);
	hex_decoder h1({1'b0,n_state}, HEX1);
endmodule



module hex_decoder(hex_digit, segments);
    input [3:0] hex_digit;
    output reg [6:0] segments;
   
    always @(*)
        case (hex_digit)
            4'h0: segments = 7'b100_0000;
            4'h1: segments = 7'b111_1001;
            4'h2: segments = 7'b010_0100;
            4'h3: segments = 7'b011_0000;
            4'h4: segments = 7'b001_1001;
            4'h5: segments = 7'b001_0010;
            4'h6: segments = 7'b000_0010;
            4'h7: segments = 7'b111_1000;
            4'h8: segments = 7'b000_0000;
            4'h9: segments = 7'b001_1000;
            4'hA: segments = 7'b000_1000;
            4'hB: segments = 7'b000_0011;
            4'hC: segments = 7'b100_0110;
            4'hD: segments = 7'b010_0001;
            4'hE: segments = 7'b000_0110;
            4'hF: segments = 7'b000_1110;   
            default: segments = 7'h7f;
        endcase
endmodule


module clockdelay2(reset, clock, clk);
	input clock, reset;
	output reg clk;
	reg 	[13:0] 	q;
	
	always @(posedge clock) 
		begin
		if(reset)
			q <= 14'b00000000000000;
		else if(q == 14'b11111111111111)
			q <= 14'b00000000000000;
		else q <= q + 1'b1;
		end
   
    always@(*)
    begin
		clk <= (q == 14'b11111111111111)? 1'b1: 1'b0;
    end
endmodule
