module control(start, clock, direction, oldvalues, update, newvalues, endstatus);
	input start, clock;
	input [3:0] direction;
	input [16 * 4 - 1 : 0] oldvalues;
	output [16 * 4 - 1 : 0] newvalues;
	output update; // enable for loading new values
	output reg [1:0] endstatus; // 00: in game, 01: lose, 10: win
	reg [3:0]  box1in, box2in, box3in, box4in, box5in, box6in, box7in, box8in, 
				box9in, box10in, box11in, box12in, box13in, box14in, box15in, box16in;
	wire [3:0]  box1_firin, box2_firin, box3_firin, box4_firin, box5_firin, box6_firin, box7_firin, box8_firin, 
				box9_firin, box10_firin, box11_firin, box12_firin, box13_firin, box14_firin, box15_firin, box16_firin;
	wire [3:0]  box_move1in, box_move2in, box_move3in, box_move4in, box_move5in, box_move6in, box_move7in, box_move8in, 
				box_move9in, box_move10in, box_move11in, box_move12in, box_move13in, box_move14in, box_move15in, box_move16in; 
	wire [3:0] box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
				box10out, box11out, box12out, box13out, box14out, box15out, box16out; // out is old values, in is new values
	wire win, lose, clk;
	reg enable_move, enable_givenum;
	reg update_inside;
	wire [3:0] random1;
	reg [1:0] direction_bi;
	
	always@(*)
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
	
	
	variable_counter v0(start, clock, random1);
			
	
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
	
	reg [2:0] current_state, next_state;
	
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
			MOVE: next_state = WAIT;
			END: next_state = start? INIT2: END;
			default: next_state = INIT2;
		endcase
	end
	
	always@(posedge clock) // current state operation signals
	begin
		update_inside <= 1'b0;
		enable_givenum <= 1'b0;
		enable_move <= 1'b0;
		case(current_state)
			//INIT: do nothing?
			INIT2: 
				begin
				enable_givenum <= 1'b1;
				enable_move <= 1'b0;
				box1in <= box1_firin;
				box2in <= box2_firin;
				box3in <= box3_firin;
				box4in <= box4_firin;
				box5in <= box5_firin;
				box6in <= box6_firin;
				box7in <= box7_firin;
				box8in <= box8_firin;
				box9in <= box9_firin;
				box10in <= box10_firin;
				box11in <= box11_firin;
				box12in <= box12_firin;
				box13in <= box13_firin;
				box14in <= box14_firin;
				box15in <= box15_firin;
				box16in <= box16_firin;
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
	
	clockdelay c1(clock, ~start, 1'b1, clk);
	
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
					
	first_placement fargy1(box1out, box2out, box3out, box4out, box5out, box6out, box7out, box8out, box9out, 
					box10out, box11out, box12out, box13out, box14out, box15out, box16out, box1_firin, box2_firin, box3_firin, box4_firin, box5_firin, box6_firin, box7_firin, 
					box8_firin, box9_firin, box10_firin, box11_firin, box12_firin, box13_firin, box14_firin, box15_firin, box16_firin,clock, enable_givenum, random1);

endmodule


module clockdelay(clock, reset_n, enable, clk);
	input clock, reset_n, enable;
	output reg clk;
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
		clk <= (q == 2'b11)? 1'b1: 1'b0;
    end
endmodule
