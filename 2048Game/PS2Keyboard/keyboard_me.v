module keyboard_me(
    input CLOCK_50,
	 input [1:0] SW,
	 
	 inout PS2_CLK,
	 inout PS2_DAT,
	 
	 output [3:0] direction,
	 output reset,
	 output start
	 );
	 
	 wire w,a,s,d,r,u,l,e;

	 keyboard_tracker beige (CLOCK_50, ~SW[0], PS2_CLK, PS2_DAT,w, 
		a,s, d, r,u,e, l, reset, start); 
	assign direction = {w,s,d,a};
endmodule
