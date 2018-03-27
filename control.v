module control(start, clock, up, down, left, right, oldvalues, update, newvalues, endstatus);
	input start, clock, up, down, right, left;
	input [16 * 4 - 1 : 0] oldvalues; //new values for all boxes
	output update; // is the enable for the boxes to load new values
	output [16 * 4 - 1 : 0] newvalues; //old values from all boxes
	output reg [1:0] endstatus; // 00: in game, 01: lose, 10: win
	wire [3:0]  box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, 
				box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in, 
				box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
				box10out, box11out, box12out, box13out, box14out, box15out, box16out;
	reg action;
	wire done_move;
	
	
	reg [1:0] current_state, nex_state;
	
	localparam  INIT = 2'b00,
				WAIT = 2'b01,
				MOVE = 2'b10,
				END = 2'b11;
	
	// Update next state	
	always@(*)
	begin: state_table
	//TODO: signals change. need to keep their value until next clock cycle
		case(current_state)
			INIT: next_state = start? WAIT: INIT; // init with empty board, wait for start
			WAIT: 
				if (ends == 2'b00)
					next_state = action? MOVE: WAIT; // wait for arrow pressed
				else
					next_state = END;
			MOVE: next_state = !done_move? MOVE: WAIT; // wait for move done
			END:  next_state = start? WAIT: END; // end game, wait for start
		endcase
	end // state_table
	
	// Performance of current state
	always@(*)
	begin: operations
		//default enable
		update = 1'b0
		case(current_state)
			INIT: // do nothing?
			WAIT: start = 0; // keep start 0
			MOVE: 
			move m0(direction, clock, reset, enable, box1in, box2in, box3in, box4in, box5in, box6in, box7in, 
					box8in, box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in, 
					box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
					box10out, box11out, box12out, box13out, box14out, box15out, box16out, done_move);
			END:
			// something
		endcase
	end // operations
	
	// Update current state
	always@(posedge clk)
    begin: state_FFs
        if(start)
            current_state <= INIT;
			start = 1'b0;
        else
            current_state <= next_state;
    end // state_FFS
		




	
endmodule