module control(start, clock, up, down, right, left, oldvalues, update, newvalues);
	input start, clock, up, down, right, left;
	input [16 * 4 - 1 : 0] newvalues; //new values for all boxes
	output update; // is the enable for the boxes to load new values
	output [16 * 4 - 1 : 0] oldvalues; //old values from all boxes

	// TODO: Different states
	// TODO: actions according to states
endmodule