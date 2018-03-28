module control(start, clock, direction, oldvalues, update, newvalues, endstatus);
	input start, clock;
	input [3:0] direction;
	input [16 * 4 - 1 : 0] oldvalues;
	output [16 * 4 - 1 : 0] newvalues;
	output update; // enable for loading new values
	output reg [1:0] endstatus; // 00: in game, 01: lose, 10: win
	wire [3:0]  box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, 
				box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in, 
				box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
				box10out, box11out, box12out, box13out, box14out, box15out, box16out; // out is old values, in is new values
	wire done_move, win, lose, enable_move, enable_givenum, clk;
	
	assign win = ((box1out == 4'b1011) || (box2out == 4'b1011) || (box3out == 4'b1011 ) || ( box4out == 4'b1011 ) || 
			(box5out == 4'b1011 ) || ( box6out == 4'b1011 ) || ( box7out == 4'b1011 ) || ( box8out == 4'b1011 ) || 
			(box9out == 4'b1011 ) || ( box10out == 4'b1011 ) || ( box11out == 4'b1011 ) || ( box12out == 4'b1011 ) || 
			(box13out == 4'b1011 ) || ( box14out == 4'b1011 ) || ( box15out == 4'b1011 ) || ( box16out == 4'b1011));
	assign lose = ((box1out != 4'b0000) && (box2out != 4'b0000) && (box3out != 4'b0000 ) && ( box4out != 4'b0000 ) && 
			(box5out != 4'b0000 ) && ( box6out != 4'b0000 ) && ( box7out != 4'b0000 ) && ( box8out != 4'b0000 ) && 
			(box9out != 4'b0000 ) && ( box10out != 4'b0000 ) && ( box11out != 4'b0000 ) && ( box12out != 4'b0000 ) && 
			(box13out != 4'b0000 ) && ( box14out != 4'b0000 ) && ( box15out != 4'b0000 ) && ( box16out != 4'b0000) && 
			(box1out != box2out) && (box2out != box3out) && (box3out != box4out) && (box1out != box5out) && (box2out != box6out) &&
			(box3out != box7out) && (box4out != box8out) && (box5out != box6out) && (box6out != box7out) && (box7out != box8out) &&
			(box5out != box9out) && (box6out != box10out) && (box7out != box11out) && (box8out != box12out) && (box9out != box10out) &&
			(box10out != box11out) && (box11out != box12out) && (box9out != box13out) && (box10out != box14out) && (box11out != box15out) &&
			(box12out != box16out) && (box13out != box14out) && (box14out != box15out) && (box15out != box16out)); 
	
	assign {box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
				box10out, box11out, box12out, box13out, box14out, box15out, box16out} = oldvalues;
	assign newvalues = {box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, 
				box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in};
	
	reg [1:0] current_state, next_state;
	
	localparam  INIT = 3'b101,
				INIT2 = 3'b001, 
				WAIT = 3'b011,
				MOVE = 3'b010,
				END = 3'b000;
	
	always@(*) // update next state
	begin
		case(current_state)
			INIT: next_state = start? INIT2: INIT;
			INIT2: next_state = start? INIT2: WAIT;
			WAIT: 
			begin
			if(start)
				next_state = INIT2;
			else if(endstatus == 2'b00)
				next_state = END;
			else
				next_state = (direction != 4'b0000)? MOVE: WAIT;
			end
			MOVE: next_state = done_move? WAIT: MOVE; // or just next_state = WAIT; ?
			END: next_state = start? INIT2: END;
			default: next_state = INIT2;
		endcase
	end
	
	always@(*) // current state operation signals
	begin
		update = 1'b0;
		enable_givenum = 1'b0;
		enable_move = 1'b0;
		case(current_state)
			//INIT: do nothing?
			INIT2: 
				enable_givenum = 1'b1;
				update = 1'b1;
			WAIT: 
				enable_givenum = 1'b1;
				update = 1'b1;
			MOVE: 
				enable_move = 1'b1;
				update = 1'b1;
			//END: do nothing?
		endcase
	end
	
	clockdelay c1(clock, ~start, enable, clk);
	
	// Update current state
	always@(posedge clk)
    begin
        if(start)
            current_state <= INIT2;
        else
            current_state <= next_state;
    end
	
	always@(*) // check for win/lose
	begin 
		if(win)
			endstatus <= 01;
		else if(lose)
			endstatus <= 10;
		else
			endstatus <= 00;
	end
	
	move m0(direction, clock, reset, enable_move, box1in, box2in, box3in, box4in, box5in, box6in, box7in, 
					box8in, box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in, 
					box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
					box10out, box11out, box12out, box13out, box14out, box15out, box16out, done_move);
					
	give_number g1(enable_givenum, clock, box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
				box10out, box11out, box12out, box13out, box14out, box15out, box16out, box1in, box2in, box3in, box4in, 
				box5in, box6in, box7in, box8in, box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in);

endmodule


module clockdelay(clock, reset_n, enable, clk);
	input clock, reset_n, enable;
	output clk;
	reg 	[1:0] 	q;
	
	always @(posedge clock) begin
		if(reset_n == 1'b0)
			q <= 2'b00;
		else if (enable == 1'b1)
		begin
		  if (q == 2'b11)
			  q <= 2'b00;
		  else
			  q <= q + 1'b1;
		end
   end
   
    always@(*)
    begin
		assign clk = (q == 2'b11)? 1'b1: 1'b0;
    end
endmodule
