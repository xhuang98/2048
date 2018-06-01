module first_placement(o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16, clock_iner, random_number_in, enable_in);
	input [3:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;
	output [3:0] q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16;
	input clock_iner;
	input enable_in;
	input random_number_in;
	first_final firstfinalf1(o1, o2, o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14, o15, o16, q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16, clock_iner,enable_in, random_number_in);
endmodule

module first_final (SQ1, SQ2,SQ3,SQ4,SQ5,SQ6,SQ7,SQ8,SQ9,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16, NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16, CLOCK_IN, CONTROL,MOVER);
	input [3:0] SQ1, SQ2,SQ3,SQ4,SQ5,SQ6,SQ7,SQ8,SQ9,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16;
	wire [3:0] S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16;
	reg [3:0] onu1, onu2, onu3, onu4, onu5, onu6, onu7, onu8, onu9, onu10, onu11, onu12, onu13, onu14, onu15, onu16;
	output [3:0] NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16;
	input CONTROL;
	input CLOCK_IN;
	input [3:0] MOVER;
	firsty fist1(.box1(SQ1),.box2(SQ2),.box3(SQ3),.box4(SQ4),.box5(SQ5),.box6(SQ6),.box7(SQ7),.box8(SQ8),.box9(SQ9),.box10(SQ10),.box11(SQ11),.box12(SQ12),.box13(SQ13),.box14(SQ14),.box15(SQ15),
	.box16(SQ16),.q1(S1), .q2(S2),.q3(S3),.q4(S4),.q5(S5),.q6(S6),.q7(S7),.q8(S8),.q9(S9),.q10(S10),.q11(S11),.q12(S12),.q13(S13),.q14(S14),.q15(S15),.q16(S16), .clock(CLOCK_IN),.randombox(MOVER));
	
	always @(posedge CLOCK_IN)
		begin
			case(CONTROL)
				0:begin
					onu1 <= SQ1;
					onu2 <= SQ2;
					onu3 <= SQ3;
					onu4 <= SQ4;
					onu5 <= SQ5;
					onu6 <= SQ6;
					onu7 <= SQ7;
					onu8 <= SQ8;
					onu9 <= SQ9;
					onu10 <= SQ10;
					onu11 <= SQ11;
					onu12 <= SQ12;
					onu13 <= SQ13;
					onu14 <= SQ14;
					onu15 <= SQ15;
					onu16 <= SQ16;
					end
				1:begin
					onu1 <= S1;
					onu2 <= S2;
					onu3 <= S3;
					onu4 <= S4;
					onu5 <= S5;
					onu6 <= S6;
					onu7 <= S7;
					onu8 <= S8;
					onu9 <= S9;
					onu10 <= S10;
					onu11 <= S11;
					onu12 <= S12;
					onu13 <= S13;
					onu14 <= S14;
					onu15 <= S15;
					onu16 <= S16;
					end
				endcase
		end
	assign NSQ1= onu1;
	assign NSQ2 = onu2;
	assign NSQ3 = onu3;
	assign NSQ4 = onu4;
	assign NSQ5 = onu5;
	assign NSQ6 = onu6;
	assign NSQ7 = onu7;
	assign NSQ8= onu8;
	assign NSQ9= onu9;
	assign NSQ10= onu10;
	assign NSQ11= onu11;
	assign NSQ12= onu12;
	assign NSQ13= onu13;
	assign NSQ14= onu14;
	assign NSQ15= onu15;
	assign NSQ16= onu16;
endmodule

module firsty (clock, randombox,box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	reg [3:0] qt1,qt2,qt3,qt4,qt5,qt6,qt7,qt8,qt9,qt10,qt11,qt12,qt13,qt14,qt15,qt16;
	output [3:0] q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16;
	input [3:0] randombox;
	input clock;
	
	always@(posedge clock)
		begin
			case(randombox)
				0: begin
						qt1 <= 4'b0001;
						qt2 <= box2;
						qt3 <= 4'b0001;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				1: begin
						qt1 <= box1;
						qt2 <= 4'b0001;
						qt3 <= box3;
						qt4 <= 4'b0001;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				2: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= 4'b0001;
						qt4 <= box4;
						qt5 <= 4'b0001;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;							
					end
				3: begin							
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= 4'b0001;
						qt5 <= box5;
						qt6 <= 4'b0001;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				4: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= 4'b0001;
						qt6 <= box6;
						qt7 <= 4'b0001;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				5: begin							
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= 4'b0001;
						qt7 <= box7;
						qt8 <= 4'b0001;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				6: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= 4'b0001;
						qt8 <= box8;
						qt9 <= 4'b0001;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				7: begin							
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= 4'b0001;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= 4'b0001;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				8: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= 4'b0001;
						qt10 <= box10;
						qt11 <= 4'b0001;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				9: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= 4'b0001;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= 4'b0001;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				10: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= 4'b0001;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= 4'b0001;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
					end
				11: begin							
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= 4'b0001;
						qt13 <= box13;
						qt14 <= 4'b0001;
						qt15 <= box15;
						qt16 <= box16;
					end
				12: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= 4'b0001;
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= 4'b0001;
					end
				13: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= 4'b0001;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= 4'b0001;
						qt15 <= box15;
						qt16 <= box16;
					end
				14: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= 4'b0001;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= box14;
						qt15 <= 4'b0001;
						qt16 <= box16;
					end
				15: begin
						qt1 <= box1;
						qt2 <= box2;
						qt3 <= box3;
						qt4 <= box4;
						qt5 <= box5;
						qt6 <= box6;
						qt7 <= box7;
						qt8 <= box8;
						qt9 <= box9;
						qt10 <= box10;
						qt11 <= box11;
						qt12 <= box12;
						qt13 <= box13;
						qt14 <= 4'b0001;
						qt15 <= box15;
						qt16 <= 4'b0001;
					end
			endcase
		end
		assign q1=qt1;
		assign q2=qt2;
		assign q3=qt3;
		assign q4=qt4;
		assign q5=qt5;
		assign q6=qt6;
		assign q7=qt7;
		assign q8=qt8;
		assign q9=qt9;
		assign q10=qt10;
		assign q11=qt11;
		assign q12=qt12;
		assign q13=qt13;
		assign q14=qt14;
		assign q15=qt15;
		assign q16=qt16;
endmodule
