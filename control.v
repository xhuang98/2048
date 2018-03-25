module control(start, clock, up, down, right, left, update, values);
	input start, clock, up, down, right, left;
	output update; // is the enable for the boxes to load new values
	output [16 * 4 : 0] values; //new values for all boxes
	
	
endmodule