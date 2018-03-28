module state_final (CLOCK_IN, randomnumber_generated,CONTROL, SQ1, SQ2,SQ3,SQ4,SQ5,SQ6,SQ7,SQ8,SQ9,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16, NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16, mux_ind);
	input [3:0] SQ1, SQ2,SQ3,SQ4,SQ5,SQ6,SQ7,SQ8,SQ9,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16;
	wire [3:0] S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16;
	reg [3:0] onu1, onu2, onu3, onu4, onu5, onu6, onu7, onu8, onu9, onu10, onu11, onu12, onu13, onu14, onu15, onu16;
	output [3:0] NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16;
	input CONTROL;
	input [3:0] randomnumber_generated;
	output [1:0] mux_ind;
	input CLOCK_IN;
	state_below statbel(.outvalue(randomnumber_generated), .b1(SQ1), .b2(SQ2),.b3(SQ3),.b4(SQ4),
	.b5(SQ5),.b6(SQ6),.b7(SQ7),.b8(SQ8),.b9(SQ9),.b10(SQ10),.b11(SQ11),.b12(SQ12),.b13(SQ13),.b14(SQ14),.b15(SQ15),
	.b16(SQ16),.bart1(S1), .bart2(S2),.bart3(S3),.bart4(S4),.bart5(S5),.bart6(S6),
	.bart7(S7),.bart8(S8),.bart9(S9),.bart10(S10),.bart11(S11),.bart12(S12),.bart13(S13),.bart14(S14),.bart15(S15),.bart16(S16), .select(mux_ind), .clock_inner(CLOCK_IN));
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

module state_below(clock_inner, outvalue, b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16,bart1, bart2,bart3,bart4,bart5,bart6,bart7,bart8,bart9,bart10,bart11,bart12,bart13,bart14,bart15,bart16, select);
	input [3:0] b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16;	
	wire [3:0] k1, k2, k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14, k15, k16;	
	wire [3:0] kr1, kr2, kr3,kr4,kr5,kr6,kr7,kr8,kr9,kr10,kr11,kr12,kr13,kr14, kr15, kr16;	
	wire mux_rand;
	wire mux_other;
	output [1:0] select;
	input [3:0] outvalue;
	reg [3:0] ror1, ror2,ror3,ror4,ror5,ror6,ror7,ror8,ror9,ror10,ror11,ror12,ror13,ror14,ror15,ror16;
	output [3:0] bart1, bart2,bart3,bart4,bart5,bart6,bart7,bart8,bart9,bart10,bart11,bart12,bart13,bart14,bart15,bart16;
	input clock_inner;
	
	random_number_grabber r0(.clock(clock_inner),.randombox(outvalue), .box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16),.q1(k1),.q2(k2),.q3(k3),.q4(k4),.q5(k5),.q6(k6),.q7(k7),.q8(k8),.q9(k9),.q10(k10),.q11(k11),.q12(k12),.q13(k13),.q14(k14),.q15(k15),.q16(k16), .muxy(mux_rand));
	
	other_checker r1(.clock(clock_inner),.box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16),.boxy1(kr1),.boxy2(kr2),.boxy3(kr3),.boxy4(kr4),.boxy5(kr5),.boxy6(kr6),.boxy7(kr7),.boxy8(kr8),.boxy9(kr9),.boxy10(kr10),.boxy11(kr11),.boxy12(kr12),.boxy13(kr13),.boxy14(kr14),.boxy15(kr15),.boxy16(kr16), .mux_other(mux_other));
	
	assign select = {mux_other, mux_rand};
	
	always@(posedge clock_inner)
	begin
		case(select)
			0: begin
				ror1 <= b1;
				ror2 <= b2;
				ror3 <= b3;
				ror4 <= b4;
				ror5 <= b5;
				ror6 <= b6;
				ror7 <= b7;
				ror8 <= b8;
				ror9 <= b9;
				ror10 <= b10;
				ror11 <= b11;
				ror12 <= b12;
				ror13 <= b13;
				ror14 <= b14;
				ror15 <= b15;
				ror16 <= b16;
				end
			1: begin
				ror1 <= b1;
				ror2 <= b2;
				ror3 <= b3;
				ror4 <= b4;
				ror5 <= b5;
				ror6 <= b6;
				ror7 <= b7;
				ror8 <= b8;
				ror9 <= b9;
				ror10 <= b10;
				ror11 <= b11;
				ror12 <= b12;
				ror13 <= b13;
				ror14 <= b14;
				ror15 <= b15;
				ror16 <= b16;
				end
			2: begin
				ror1 <= kr1;
				ror2 <= kr2;
				ror3 <= kr3;
				ror4 <= kr4;
				ror5 <= kr5;
				ror6 <= kr6;
				ror7 <= kr7;
				ror8 <= kr8;
				ror9 <= kr9;
				ror10 <= kr10;
				ror11 <= kr11;
				ror12 <= kr12;
				ror13 <= kr13;
				ror14 <= kr14;
				ror15 <= kr15;
				ror16 <= kr16;
				end
			3: begin
				ror1 <= k1;
				ror2 <= k2;
				ror3 <= k3;
				ror4 <= k4;
				ror5 <= k5;
				ror6 <= k6;
				ror7 <= k7;
				ror8 <= k8;
				ror9 <= k9;
				ror10 <= k10;
				ror11 <= k11;
				ror12 <= k12;
				ror13 <= k13;
				ror14 <= k14;
				ror15 <= k15;
				ror16 <= k16;
				end
		endcase
	end
	assign bart1 = ror1;
	assign bart2 = ror2;
	assign bart3 = ror3;
	assign bart4 = ror4;
	assign bart5 = ror5;
	assign bart6 = ror6;
	assign bart7 = ror7;
	assign bart8 = ror8;
	assign bart9 = ror9;
	assign bart10 = ror10;
	assign bart11 = ror11;
	assign bart12 = ror12;
	assign bart13 = ror13;
	assign bart14 = ror14;
	assign bart15 = ror15;
	assign bart16 = ror16;
endmodule	
	
module random_number_grabber(clock, randombox,box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16, muxy);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	reg [3:0] qt1,qt2,qt3,qt4,qt5,qt6,qt7,qt8,qt9,qt10,qt11,qt12,qt13,qt14,qt15,qt16;
	output [3:0] q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16;
	reg q;
	input [3:0] randombox;
	output muxy;
	input clock;
	always@(posedge clock)
		begin
			case(randombox)
				0: begin
						if (box1 == 4'b0000)
						begin
							q = 1'b1;
							qt1 <= 4'b0001;
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
							qt14 <= box14;
							qt15 <= box15;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				1: begin
						if (box2 == 4'b0000)
						begin
							q <= 1'b1;
							qt1 <= box1;
							qt2 <= 4'b0001;
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
							qt14 <= box14;
							qt15 <= box15;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				2: begin
						if (box3 == 4'b0000)
						begin
							q <= 1'b1;
							qt1 <= box1;
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
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				3: begin
						if (box4 == 4'b0000)
						begin
							q <= 1'b1;
							qt1 <= box1;
							qt2 <= box2;
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
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				4: begin
						if (box5 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt15 <= box15;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				5: begin
						if (box6 == 4'b0000)
						begin
							q <= 1'b1;
							qt1 <= box1;
							qt2 <= box2;
							qt3 <= box3;
							qt4 <= box4;
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
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				6: begin
						if (box7 == 4'b0000)
						begin
							q <= 1'b1;
							qt1 <= box1;
							qt2 <= box2;
							qt3 <= box3;
							qt4 <= box4;
							qt5 <= box5;
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
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				7: begin
						if (box8 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt11 <= box11;
							qt12 <= box12;
							qt13 <= box13;
							qt14 <= box14;
							qt15 <= box15;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				8: begin
						if (box9 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt11 <= box11;
							qt12 <= box12;
							qt13 <= box13;
							qt14 <= box14;
							qt15 <= box15;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				9: begin
						if (box10 == 4'b0000)
						begin
							q <= 1'b1;
							qt1 <= box1;
							qt2 <= box2;
							qt3 <= box3;
							qt4 <= box4;
							qt5 <= box5;
							qt6 <= box6;
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
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				10: begin
						if (box11 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt14 <= box14;
							qt15 <= box15;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				11: begin
						if (box12 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt14 <= box14;
							qt15 <= box15;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				12: begin
						if (box13 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				13: begin
						if (box14 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				14: begin
						if (box15 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt14 <= box14;
							qt15 <= 4'b0001;
							qt16 <= box16;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
				15: begin
						if (box16 == 4'b0000)
						begin
							q <= 1'b1;
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
							qt14 <= box14;
							qt15 <= box15;
							qt16 <= 4'b0001;
						end
						else
						begin
						q <= 1'b0;
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
						qt14 <= box14;
						qt15 <= box15;
						qt16 <= box16;
						end
					end
			endcase
		end
		assign muxy = q;
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

module other_checker (box1,clock, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16,boxy1, boxy2, boxy3,boxy4,boxy5,boxy6,boxy7,boxy8,boxy9,boxy10,boxy11,boxy12,boxy13,boxy14, boxy15, boxy16, mux_other);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	reg [3:0] qt1,qt2,qt3,qt4,qt5,qt6,qt7,qt8,qt9,qt10,qt11,qt12,qt13,qt14,qt15,qt16;
	output [3:0] boxy1, boxy2, boxy3,boxy4,boxy5,boxy6,boxy7,boxy8,boxy9,boxy10,boxy11,boxy12,boxy13,boxy14, boxy15, boxy16;
	reg q;
	input clock;
	output mux_other;
	always@(posedge clock)
		begin
			if (box1 == 4'b0000)
			begin
				q <= 1'b1;
				qt1 <= 4'b0001;
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
				qt14 <= box14;
				qt15 <= box15;
				qt16 <= box16;
			end
			else if (box2 == 4'b0000)
			begin
				q <= 1'b1;
				qt1 <= box1;
				qt2 <= 4'b0001;
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
				qt14 <= box14;
				qt15 <= box15;
				qt16 <= box16;
			end
			
			else if (box3 == 4'b0000)
			begin
				q <= 1'b1;
				qt1 <= box1;
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
			
			else if (box4 == 4'b0000)
			begin
				q <= 1'b1;
				qt1 <= box1;
				qt2 <= box2;
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
			
			else if (box5 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt15 <= box15;
				qt16 <= box16;
			end
			
			else if (box6 == 4'b0000)
			begin
				q <= 1'b1;
				qt1 <= box1;
				qt2 <= box2;
				qt3 <= box3;
				qt4 <= box4;
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
			
			else if (box7 == 4'b0000)
			begin
				q <= 1'b1;
				qt1 <= box1;
				qt2 <= box2;
				qt3 <= box3;
				qt4 <= box4;
				qt5 <= box5;
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
			
			else if (box8 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt11 <= box11;
				qt12 <= box12;
				qt13 <= box13;
				qt14 <= box14;
				qt15 <= box15;
				qt16 <= box16;
			end
			
			else if (box9 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt11 <= box11;
				qt12 <= box12;
				qt13 <= box13;
				qt14 <= box14;
				qt15 <= box15;
				qt16 <= box16;
			end
			
			else if (box10 == 4'b0000)
			begin
				q <= 1'b1;
				qt1 <= box1;
				qt2 <= box2;
				qt3 <= box3;
				qt4 <= box4;
				qt5 <= box5;
				qt6 <= box6;
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
			
			else if (box11 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt14 <= box14;
				qt15 <= box15;
				qt16 <= box16;
			end
			
			else if (box12 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt14 <= box14;
				qt15 <= box15;
				qt16 <= box16;
			end
			
			else if (box13 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt16 <= box16;
			end
			
			else if (box14 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt16 <= box16;
			end
			
			else if (box15 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt14 <= box14;
				qt15 <= 4'b0001;
				qt16 <= box16;
			end
			
			else if (box16 == 4'b0000)
			begin
				q <= 1'b1;
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
				qt14 <= box14;
				qt15 <= box15;
				qt16 <= 4'b0001;
			end
		end
		assign mux_other = q;
		assign boxy1=qt1;
		assign boxy2=qt2;
		assign boxy3=qt3;
		assign boxy4=qt4;
		assign boxy5=qt5;
		assign boxy6=qt6;
		assign boxy7=qt7;
		assign boxy8=qt8;
		assign boxy9=qt9;
		assign boxy10=qt10;
		assign boxy11=qt11;
		assign boxy12=qt12;
		assign boxy13=qt13;
		assign boxy14=qt14;
		assign boxy15=qt15;
		assign boxy16=qt16;
endmodule
