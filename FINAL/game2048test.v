module game2048(

		KEY,
		SW,							// temporary input
		CLOCK_50,
		);
	//input: arrow keys, s key (start)
	input			CLOCK_50;				//	50 MHz
	input 	[1:0]	SW;					// SW0 is start, SW1 is reset
	input [3:0] KEY;						// KEY[3:0] is direction (up, down, left, right)
	
	wire start, reset, reset_boxes;
	wire [16 * 4 - 1 : 0] newvalues;
	wire [16 * 4 - 1 : 0] oldvalues;
	wire [3:0] box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in;
	wire [3:0] box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, box10out, box11out, box12out, box13out, box14out, box15out, box16out;
	wire enable, clock;
	wire [1:0] endstatus;
	reg [3:0] direction;
	reg reset_n;

	wire [2:0] state, n_state;
	
	// TODO: Assign keyboard to start
	//assign start = SW[0];
	//assign reset = SW[1];
	
	assign reset_boxes = (start || reset);
	
	//clockdelay2 c2(reset, CLOCK_50, clock);
	//assign clock = CLOCK_50;
	
	
	
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

endmodule



