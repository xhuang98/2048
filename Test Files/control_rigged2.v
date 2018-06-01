module control(reset, start, clock, direction, oldvalues, update, newvalues, endstatus, current_state, next_state);
	input start, clock, reset;
	input [3:0] direction;
	input [16 * 4 - 1 : 0] oldvalues;
	output [16 * 4 - 1 : 0] newvalues;
	output update; // enable for loading new values
	output reg [1:0] endstatus; // 00: in game, 01: lose, 10: win
	reg [3:0]  box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, 
				box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in;
	wire [3:0]  box_move1in, box_move2in, box_move3in, box_move4in, box_move5in, box_move6in, box_move7in, box_move8in, 
				box_move9in, box_move10in, box_move11in, box_move12in, box_move13in, box_move14in, box_move15in, box_move16in; 
	wire [3:0] box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
				box10out, box11out, box12out, box13out, box14out, box15out, box16out; // out is old values, in is new values
	wire win, lose, clk;
	reg enable_move, enable_givenum;
	reg update_inside;
	wire [3:0] random1;
	reg [1:0] direction_bi;
	wire dir;
	assign dir = |direction;

	
	always@(posedge clock)
	begin
		case(direction)
			4'b0001: //0001 <=
				begin direction_bi <= 2'b00; end
			4'b0010: //=>
				begin direction_bi <= 2'b01; end
			4'b0100: //down
				begin direction_bi <= 2'b10; end
			4'b1000: //up
				begin direction_bi <= 2'b11; end
			default:
				begin direction_bi <= 2'b00; end
		endcase
	end
	
	
	variable_counter v0(reset, clock, random1);
			
	
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
	
	output reg [2:0] current_state, next_state; // temporary output
	
	localparam  		INIT = 3'b101,
				INIT2 = 3'b001, 
				WAIT = 3'b011,
				MOVE = 3'b010,
				END = 3'b000;	

	always@(*) // update next state
	begin
		casex(current_state)
			INIT: begin next_state = INIT2; end
			INIT2: begin next_state = start? INIT2: WAIT; end
			WAIT: 
			begin
			if(start)
				next_state = INIT2;
			else if(endstatus != 2'b00)
				next_state = END;
			else if(direction != 4'b0000) 
				next_state = MOVE;
			else
				next_state = WAIT;
			end
			MOVE: begin next_state = WAIT; end
			END: begin next_state = start? INIT: END; end
			//default: next_state = INIT;
		endcase
		
	end

/*	always@(posedge dir) begin
			if(current_state == WAIT)	
				next_state = MOVE; 
		end
		*/

	
	always@(*) // current state operation signals
	begin
		update_inside <= 1'b0;
		enable_givenum <= 1'b0;
		enable_move <= 1'b0;
		case(current_state)
			INIT:
				begin
				if(reset | start) begin enable_givenum <= 1'b1; end
				else begin enable_givenum <= 1'b0; end
				box1in <= 4'b0000;
				box2in <= 4'b0000;
				box3in <= 4'b0000;
				box4in <= 4'b0000;
				box5in <= 4'b0000;
				box6in <= 4'b0000;
				box7in <= 4'b0000;
				box8in <= 4'b0000;
				box9in <= 4'b0000;
				box10in <= 4'b0000;
				box11in <= 4'b0000;
				box12in <= 4'b0000;
				box13in <= 4'b0000;
				box14in <= 4'b0000;
				box15in <= 4'b0000;
				box16in <= 4'b0000;
				update_inside <= 1'b1;
				end
			INIT2: 
				begin
				if (random1==4'b0000)
					begin
					enable_givenum <= 1'b1;
					enable_move <= 1'b0;
				box1in <= 4'b0101;
				box2in <= 4'b0100;
				box3in <= 4'b0101;
				box4in <= 4'b0100;
				box5in <= 4'b0100;
				box6in <= 4'b0101;
				box7in <= 4'b0100;
				box8in <= 4'b0001;
				box9in <= 4'b0101;
				box10in <= 4'b0100;
				box11in <= 4'b0101;
				box12in <= 4'b0100;
				box13in <= 4'b0100;
				box14in <= 4'b0101;
				box15in <= 4'b0001;
				box16in <= 4'b1001;

					end
				else if (random1 > 4'b1100)
					begin
					box1in <= 4'b0101;
				box2in <= 4'b0100;
				box3in <= 4'b0101;
				box4in <= 4'b0100;
				box5in <= 4'b0100;
				box6in <= 4'b0101;
				box7in <= 4'b0100;
				box8in <= 4'b0001;
				box9in <= 4'b0101;
				box10in <= 4'b0100;
				box11in <= 4'b0101;
				box12in <= 4'b0100;
				box13in <= 4'b0100;
				box14in <= 4'b0101;
				box15in <= 4'b0000;
				box16in <= 4'b1001;
					end
				else
					begin
				box1in <= 4'b0101;
				box2in <= 4'b0100;
				box3in <= 4'b0101;
				box4in <= 4'b0100;
				box5in <= 4'b0100;
				box6in <= 4'b0101;
				box7in <= 4'b0100;
				box8in <= 4'b0001;
				box9in <= 4'b0101;
				box10in <= 4'b0100;
				box11in <= 4'b0101;
				box12in <= 4'b0100;
				box13in <= 4'b0100;
				box14in <= 4'b0101;
				box15in <= 4'b0000;
				box16in <= 4'b1001;
					end
					update_inside <= 1'b1;
				end			
			WAIT:
				begin
				enable_givenum <= 1'b0;
				enable_move <= 1'b0;	
				box1in <= box1out;
				box2in <= box2out;
				box3in <= box3out;
				box4in <= box4out;
				box5in <= box5out;
				box6in <= box6out;
				box7in <= box7out;
				box8in <= box8out;
				box9in <= box9out;
				box10in <= box10out;
				box11in <= box11out;
				box12in <= box12out;
				box13in <= box13out;
				box14in <= box14out;
				box15in <= box15out;
				box16in <= box16out;
				end
			MOVE: 
				begin
				enable_givenum <= 1'b0;
				enable_move <= 1'b1;
				box1in <= box_move1in;
				box2in <= box_move2in;
				box3in <= box_move3in;
				box4in <= box_move4in;
				box5in <= box_move5in;
				box6in <= box_move6in;
				box7in <= box_move7in;
				box8in <= box_move8in;
				box9in <= box_move9in;
				box10in <= box_move10in;
				box11in <= box_move11in;
				box12in <= box_move12in;
				box13in <= box_move13in;
				box14in <= box_move14in;
				box15in <= box_move15in;
				box16in <= box_move16in;
				update_inside <= 1'b1;
				end
			//END: do nothing?
		endcase
	end
	assign update = update_inside;
	
	clockdelay c1(clock, ~reset, 1'b1, clk);
	//assign clk = clock;
	
	// Update current state
	always@(posedge clock)
	begin
        if(start | reset)
			begin
            current_state <= INIT;
			end
        else
			begin
            current_state <= next_state;
			end
	end
	
	always@(*) // check for win/lose
	begin 
		if(win)
		begin
			endstatus <= 2'b01;
		end
		else if(lose)
		begin
			endstatus <= 2'b10;
		end
		else
		begin
			endstatus <= 2'b00;
		end
	end
	
	move mo(box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
					box10out, box11out, box12out, box13out, box14out, box15out, box16out, box_move1in, box_move2in, box_move3in, box_move4in, box_move5in, box_move6in, box_move7in, 
					box_move8in, box_move9in, box_move10in, box_move11in, box_move12in, box_move13in, box_move14in, box_move15in, box_move16in, clock, direction_bi, enable_move, random1);

endmodule


module clockdelay(clock, reset_n, enable, clk);
	input clock, reset_n, enable;
	output reg clk;
	reg  	q;
	
	always @(posedge clock) begin
		if(reset_n == 1'b0)
			q <= 0;
		else if (enable == 1'b1)
		begin
		  if (q == 1)
			  q <= 0;
		  else
			  q <= q + 1'b1;
		end
   end
   
    always@(*)
    begin
		clk <= (q == 1)? 1'b1: 1'b0;
    end
endmodule

