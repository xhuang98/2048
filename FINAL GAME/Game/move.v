module move (po1,po2,po3,po4,po5,po6,po7,po8,po9,po10,po11,po12,po13,po14,po15,po16,pq1,pq2,pq3,pq4,pq5,pq6,pq7,pq8,pq9,pq10,pq11,pq12,pq13,pq14,pq15,pq16, clock_inere, real_movemente, real_movemen_te, random_number_ine);
	input [3:0] po1,po2,po3,po4,po5,po6,po7,po8,po9,po10,po11,po12,po13,po14,po15,po16;
	input clock_inere;
	input [1:0] real_movemente;
	input real_movemen_te;
	input [3:0] random_number_ine;
	output [3:0] pq1,pq2,pq3,pq4,pq5,pq6,pq7,pq8,pq9,pq10,pq11,pq12,pq13,pq14,pq15,pq16;
	
	move_below mer1(po1,po2,po3,po4,po5,po6,po7,po8,po9,po10,po11,po12,po13,po14,po15,
	po16,pq1,pq2,pq3,pq4,pq5,pq6,pq7,pq8,pq9,pq10,pq11,pq12,pq13,pq14,pq15,pq16, clock_inere, real_movemente[1:0],real_movemen_te ,random_number_ine);
	
endmodule
	
module move_below(o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16, clock_iner, real_movement, real_movemen_t, random_number_in);
	input [3:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;
	wire [3:0] qt1,qt2,qt3,qt4,qt5,qt6,qt7,qt8,qt9,qt10,qt11,qt12,qt13,qt14,qt15,qt16;
	wire [3:0] q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16;
	reg [3:0] onu1, onu2, onu3, onu4, onu5, onu6, onu7, onu8, onu9, onu10, onu11, onu12, onu13, onu14, onu15, onu16;	
	output [3:0] NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16;
	input clock_iner;
	input [1:0] real_movement;
	input real_movemen_t;
	wire [1:0] muxer;
	input [3:0] random_number_in;
	move_final m1(o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,
	o16,qt1,qt2,qt3,qt4,qt5,qt6,qt7,qt8,qt9,qt10,qt11,qt12,qt13,qt14,qt15,qt16, clock_iner,real_movemen_t, real_movement[1:0]);
	state_final s1(.CLOCK_IN(clock_iner), .randomnumber_generated(random_number_in),.CONTROL(real_movemen_t), .SQ1(qt1), .SQ2(qt2),.SQ3(qt3),.SQ4(qt4),.SQ5(qt5),.SQ6(qt6),.SQ7(qt7),.SQ8(qt8),.SQ9(qt9),.SQ10(qt10),.SQ11(qt11),.SQ12(qt12),.SQ13(qt13),.SQ14(qt14),.SQ15(qt15),.SQ16(qt16), .NSQ1(q1),.NSQ2(q2),.NSQ3(q3),.NSQ4(q4),.NSQ5(q5),.NSQ6(q6),.NSQ7(q7),.NSQ8(q8),.NSQ9(q9),.NSQ10(q10),.NSQ11(q11),.NSQ12(q12),.NSQ13(q13),.NSQ14(q14),.NSQ15(q15),.NSQ16(q16), .mux_ind(muxer));
	
	always @(*)
		begin
			case(real_movemen_t)
				0:begin
					onu1 <= o1;
					onu2 <= o2;
					onu3 <= o3;
					onu4 <= o4;
					onu5 <= o5;
					onu6 <= o6;
					onu7 <= o7;
					onu8 <= o8;
					onu9 <= o9;
					onu10 <= o10;
					onu11 <= o11;
					onu12 <= o12;
					onu13 <= o13;
					onu14 <= o14;
					onu15 <= o15;
					onu16 <= o16;
					end
				1:begin
					onu1 <= q1;
					onu2 <= q2;
					onu3 <= q3;
					onu4 <= q4;
					onu5 <= q5;
					onu6 <= q6;
					onu7 <= q7;
					onu8 <= q8;
					onu9 <= q9;
					onu10 <= q10;
					onu11 <= q11;
					onu12 <= q12;
					onu13 <= q13;
					onu14 <= q14;
					onu15 <= q15;
					onu16 <= q16;
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

module move_final (SQ1, SQ2,SQ3,SQ4,SQ5,SQ6,SQ7,SQ8,SQ9,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16, NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16, CLOCK_IN, CONTROL,MOVER);
	input [3:0] SQ1, SQ2,SQ3,SQ4,SQ5,SQ6,SQ7,SQ8,SQ9,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16;
	wire [3:0] S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16;
	reg [3:0] onu1, onu2, onu3, onu4, onu5, onu6, onu7, onu8, onu9, onu10, onu11, onu12, onu13, onu14, onu15, onu16;
	output [3:0] NSQ1,NSQ2,NSQ3,NSQ4,NSQ5,NSQ6,NSQ7,NSQ8,NSQ9,NSQ10,NSQ11,NSQ12,NSQ13,NSQ14,NSQ15,NSQ16;
	input CONTROL;
	input CLOCK_IN;
	input [1:0]MOVER;
	move_up m1(.old_box1(SQ1),.old_box2(SQ2),.old_box3(SQ3),.old_box4(SQ4),.old_box5(SQ5),.old_box6(SQ6),.old_box7(SQ7),.old_box8(SQ8),.old_box9(SQ9),.old_box10(SQ10),.old_box11(SQ11),.old_box12(SQ12),.old_box13(SQ13),.old_box14(SQ14),.old_box15(SQ15),
	.old_box16(SQ16),.newbox1(S1), .newbox2(S2),.newbox3(S3),.newbox4(S4),.newbox5(S5),.newbox6(S6),.newbox7(S7),.newbox8(S8),.newbox9(S9),.newbox10(S10),.newbox11(S11),.newbox12(S12),.newbox13(S13),.newbox14(S14),.newbox15(S15),.newbox16(S16), .clock_in(CLOCK_IN), .movement(MOVER));
	
	always @(*)
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

	
module move_up(old_box1,old_box2,old_box3,old_box4,old_box5,old_box6,old_box7,old_box8,old_box9,old_box10,old_box11,old_box12,old_box13,old_box14,old_box15,
	old_box16,newbox1, newbox2,newbox3,newbox4,newbox5,newbox6,newbox7,newbox8,newbox9,newbox10,newbox11,newbox12,newbox13,newbox14,newbox15,newbox16, clock_in, movement);
	input [3:0] old_box1,old_box2,old_box3,old_box4,old_box5,old_box6,old_box7,old_box8,old_box9,old_box10,old_box11,old_box12,old_box13,old_box14,old_box15,
	old_box16;
	input clock_in;
	input [1:0] movement;
	reg [3:0] newbo1, newbo2,newbo3,newbo4,newbo5,newbo6,newbo7,newbo8,newbo9,newbo10,newbo11,newbo12,newbo13,newbo14,newbo15,newbo16;
	output [3:0] newbox1, newbox2,newbox3,newbox4,newbox5,newbox6,newbox7,newbox8,newbox9,newbox10,newbox11,newbox12,newbox13,newbox14,newbox15,newbox16;
	wire [3:0] up1,up2,up3,up4,up5,up6,up7,up8,up9,up10,up11,up12,up13,up14,up15,up16, d1,d2, d3, d4, d5, d6, d7, d8, d9, d10,d11,d12,d13,d14,d15,d16,rt1,rt2,rt3,rt4,rt5,rt6,rt7,rt8,rt9,rt10;
	wire [3:0] rt11,rt12,rt13,rt14,rt15,rt16,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16;
	wire [3:0] up_temp1,up_temp2,up_temp3,up_temp4,up_temp5,up_temp6,up_temp7,up_temp8,up_temp9,up_temp10,up_temp11,up_temp12,up_temp13,up_temp14,up_temp15,up_temp16;
	wire [3:0] d_temp1,d_temp2, d_temp3, d_temp4, d_temp5, d_temp6, d_temp7, d_temp8, d_temp9, d_temp10,d_temp11,d_temp12,d_temp13,d_temp14,d_temp15,d_temp16;
	wire [3:0] r_temp1,r_temp2,r_temp3,r_temp4,r_temp5,r_temp6,r_temp7,r_temp8,r_temp9,r_temp10;
	wire [3:0] r_temp11,r_temp12,r_temp13,r_temp14,r_temp15,r_temp16,l_temp1,l_temp2,l_temp3,l_temp4,l_temp5,l_temp6,l_temp7,l_temp8,l_temp9,l_temp10;
	wire [3:0] l_temp11,l_temp12,l_temp13,l_temp14,l_temp15,l_temp16;
	
	// shifting the rows to  <= and then equivalence adding 
	block_shifter firstrow_shift(.r1(old_box1), .r2(old_box2), .r3(old_box3), .r4(old_box4), .clock(clock_in), .b1(l1), .b2(l2),.b3(l3), .b4(l4));
	block_shifter secondrow_shift(.r1(old_box5), .r2(old_box6), .r3(old_box7), .r4(old_box8), .clock(clock_in), .b1(l5), .b2(l6),.b3(l7), .b4(l8));
	block_shifter thirdrow_shift(.r1(old_box9), .r2(old_box10), .r3(old_box11), .r4(old_box12), .clock(clock_in), .b1(l9), .b2(l10),.b3(l11), .b4(l12));
	block_shifter fourthrow_shift(.r1(old_box13), .r2(old_box14), .r3(old_box15), .r4(old_box16), .clock(clock_in), .b1(l13), .b2(l14),.b3(l15), .b4(l16));
	block_adder firstrow_adder(.r1(l1), .r2(l2), .r3(l3), .r4(l4),.clock(clock_in), .b1(l_temp1), .b2(l_temp2), .b3(l_temp3), .b4(l_temp4));
	block_adder secondrow_adder(.r1(l5), .r2(l6), .r3(l7), .r4(l8),.clock(clock_in), .b1(l_temp5), .b2(l_temp6), .b3(l_temp7), .b4(l_temp8));
	block_adder thirdrow_adder(.r1(l9), .r2(l10), .r3(l11), .r4(l12),.clock(clock_in), .b1(l_temp9), .b2(l_temp10), .b3(l_temp11), .b4(l_temp12));
	block_adder fourthrow_adder(.r1(l13), .r2(l14), .r3(l15), .r4(l16),.clock(clock_in), .b1(l_temp13), .b2(l_temp14), .b3(l_temp15), .b4(l_temp16));
	
 	// shifting the rows to  => and then equivalence adding 
	block_shifter firstrow_shift0(.r1(old_box4), .r2(old_box3), .r3(old_box2), .r4(old_box1), .clock(clock_in), .b1(rt1), .b2(rt2),.b3(rt3), .b4(rt4));
	block_shifter secondrow_shift1(.r1(old_box8), .r2(old_box7), .r3(old_box6), .r4(old_box5), .clock(clock_in), .b1(rt5), .b2(rt6),.b3(rt7), .b4(rt8));
	block_shifter thirdrow_shift2(.r1(old_box12), .r2(old_box11), .r3(old_box10), .r4(old_box9), .clock(clock_in), .b1(rt9), .b2(rt10),.b3(rt11), .b4(rt12));
	block_shifter fourthrow_shift3(.r1(old_box16), .r2(old_box15), .r3(old_box14), .r4(old_box13), .clock(clock_in), .b1(rt13), .b2(rt14),.b3(rt15), .b4(rt16));
	
	block_adder firstrow_adder0(.r1(rt1), .r2(rt2), .r3(rt3), .r4(rt4),.clock(clock_in), .b1(r_temp1), .b2(r_temp2), .b3(r_temp3), .b4(r_temp4));
	block_adder secondrow_adder1(.r1(rt5), .r2(rt6), .r3(rt7), .r4(rt8),.clock(clock_in), .b1(r_temp5), .b2(r_temp6), .b3(r_temp7), .b4(r_temp8));
	block_adder thirdrow_adder2(.r1(rt9), .r2(rt10), .r3(rt11), .r4(rt12),.clock(clock_in), .b1(r_temp9), .b2(r_temp10), .b3(r_temp11), .b4(r_temp12));
	block_adder fourthrow_adder3(.r1(rt13), .r2(rt14), .r3(rt15), .r4(rt16),.clock(clock_in), .b1(r_temp13), .b2(r_temp14), .b3(r_temp15), .b4(r_temp16));	
	
 	// shifting the rows to down and then equivalence adding 
	block_shifter firstrow_shift4(.r1(old_box13), .r2(old_box9), .r3(old_box5), .r4(old_box1), .clock(clock_in), .b1(d1), .b2(d2),.b3(d3), .b4(d4));
	block_shifter secondrow_shift5(.r1(old_box14), .r2(old_box10), .r3(old_box6), .r4(old_box2), .clock(clock_in), .b1(d5), .b2(d6),.b3(d7), .b4(d8));
	block_shifter thirdrow_shift6(.r1(old_box15), .r2(old_box11), .r3(old_box7), .r4(old_box3), .clock(clock_in), .b1(d9), .b2(d10),.b3(d11), .b4(d12));
	block_shifter fourthrow_shift7(.r1(old_box16), .r2(old_box12), .r3(old_box8), .r4(old_box4), .clock(clock_in), .b1(d13), .b2(d14),.b3(d15), .b4(d16));
	
	block_adder firstrow_adder4(.r1(d1), .r2(d2), .r3(d3), .r4(d4),.clock(clock_in), .b1(d_temp1), .b2(d_temp2), .b3(d_temp3), .b4(d_temp4));
	block_adder secondrow_adder5(.r1(d5), .r2(d6), .r3(d7), .r4(d8),.clock(clock_in), .b1(d_temp5), .b2(d_temp6), .b3(d_temp7), .b4(d_temp8));
	block_adder thirdrow_adder6(.r1(d9), .r2(d10), .r3(d11), .r4(d12),.clock(clock_in), .b1(d_temp9), .b2(d_temp10), .b3(d_temp11), .b4(d_temp12));
	block_adder fourthrow_adder7(.r1(d13), .r2(d14), .r3(d15), .r4(d16),.clock(clock_in), .b1(d_temp13), .b2(d_temp14), .b3(d_temp15), .b4(d_temp16));	

 	// shifting the rows up and then equivalence adding 
	block_shifter firstrow_shift8(.r1(old_box1), .r2(old_box5), .r3(old_box9), .r4(old_box13), .clock(clock_in), .b1(up1), .b2(up2),.b3(up3), .b4(up4));
	block_shifter secondrow_shif9(.r1(old_box2), .r2(old_box6), .r3(old_box10), .r4(old_box14), .clock(clock_in), .b1(up5), .b2(up6),.b3(up7), .b4(up8));
	block_shifter thirdrow_shift10(.r1(old_box3), .r2(old_box7), .r3(old_box11), .r4(old_box15), .clock(clock_in), .b1(up9), .b2(up10),.b3(up11), .b4(up12));
	block_shifter fourthrow_shift11(.r1(old_box4), .r2(old_box8), .r3(old_box12), .r4(old_box16), .clock(clock_in), .b1(up13), .b2(up14),.b3(up15), .b4(up16));
	
	block_adder firstrow_adder8(.r1(up1), .r2(up2), .r3(up3), .r4(up4),.clock(clock_in), .b1(up_temp1), .b2(up_temp2), .b3(up_temp3), .b4(up_temp4));
	block_adder secondrow_adder9(.r1(up5), .r2(up6), .r3(up7), .r4(up8),.clock(clock_in), .b1(up_temp5), .b2(up_temp6), .b3(up_temp7), .b4(up_temp8));
	block_adder thirdrow_adder10(.r1(up9), .r2(up10), .r3(up11), .r4(up12),.clock(clock_in), .b1(up_temp9), .b2(up_temp10), .b3(up_temp11), .b4(up_temp12));
	block_adder fourthrow_adder11(.r1(up13), .r2(up14), .r3(up15), .r4(up16),.clock(clock_in), .b1(up_temp13), .b2(up_temp14), .b3(up_temp15), .b4(up_temp16));
	
	always @(*)
	begin
		case(movement)
			0: begin
				//<=
				newbo1 <= l_temp1;
				newbo2 <= l_temp2;
				newbo3 <= l_temp3;
				newbo4 <= l_temp4;
				newbo5 <= l_temp5;
				newbo6 <= l_temp6;
				newbo7 <= l_temp7;
				newbo8 <= l_temp8;
				newbo9 <= l_temp9;
				newbo10 <= l_temp10;
				newbo11 <= l_temp11;
				newbo12 <= l_temp12;
				newbo13 <= l_temp13;
				newbo14 <= l_temp14;
				newbo15 <= l_temp15;
				newbo16 <= l_temp16;
				end
			1: begin
				//=>
				newbo4 <= r_temp1;
				newbo3 <= r_temp2;
				newbo2 <= r_temp3;
				newbo1 <= r_temp4;
				newbo8 <= r_temp5;
				newbo7 <= r_temp6;
				newbo6 <= r_temp7;
				newbo5 <= r_temp8;
				newbo12 <= r_temp9;
				newbo11 <= r_temp10;
				newbo10 <= r_temp11;
				newbo9 <= r_temp12;
				newbo16 <= r_temp13;
				newbo15 <= r_temp14;
				newbo14<= r_temp15;
				newbo13 <= r_temp16;
				end
			2: begin
				//down
				newbo13 <= d_temp1;
				newbo9 <= d_temp2;
				newbo5 <= d_temp3;
				newbo1 <= d_temp4;
				newbo14 <= d_temp5;
				newbo10 <= d_temp6;
				newbo6 <= d_temp7;
				newbo2 <= d_temp8;
				newbo15 <= d_temp9;
				newbo11 <= d_temp10;
				newbo7 <= d_temp11;
				newbo3 <= d_temp12;
				newbo16 <= d_temp13;
				newbo12 <= d_temp14;
				newbo8 <= d_temp15;
				newbo4 <= d_temp16;
				end
			3: begin
				//up
				newbo1 <= up_temp1;
				newbo5 <= up_temp2;
				newbo9 <= up_temp3;
				newbo13 <= up_temp4;
				newbo2 <= up_temp5;
				newbo6 <= up_temp6;
				newbo10 <= up_temp7;
				newbo14 <= up_temp8;
				newbo3 <= up_temp9;
				newbo7 <= up_temp10;
				newbo11 <= up_temp11;
				newbo15 <= up_temp12;
				newbo4 <= up_temp13;
				newbo8 <= up_temp14;
				newbo12 <= up_temp15;
				newbo16 <= up_temp16;
				end
		endcase
	end
	assign newbox1 = newbo1; 
	assign newbox2 = newbo2; 
	assign newbox3 = newbo3; 
	assign newbox4 = newbo4; 
	assign newbox5 = newbo5; 
	assign newbox6 = newbo6; 
	assign newbox7 = newbo7; 
	assign newbox8 = newbo8; 
	assign newbox9 = newbo9; 
	assign newbox10 = newbo10; 
	assign newbox11 = newbo11; 
	assign newbox12 = newbo12; 
	assign newbox13 = newbo13; 
	assign newbox14 = newbo14; 
	assign newbox15 = newbo15; 
	assign newbox16 = newbo16;
endmodule	
				
	
	
module block_shifter(r1, r2, r3, r4,clock, b1, b2, b3, b4);
	input [3:0] r1, r2, r3, r4;
	input clock;
	reg [3:0] new_box1, new_box2, new_box3, new_box4;
	output [3:0] b1, b2, b3, b4;
	
	always@(posedge clock)
		begin
			if ((r1 != 4'b0000 & r2 != 4'b0000 & r3 != 4'b0000 & r4 != 4'b0000) //1 all boxes full ||||
				| (r1 != 4'b0000 & r2 != 4'b0000 & r3 != 4'b0000 & r4 == 4'b0000) //2 three left boxes full and right most box empty |||.
				| (r1 != 4'b0000 & r2 != 4'b0000 & r3 == 4'b0000 & r4 == 4'b0000) //3 two left boxes ful and two right box||..
				| (r1 != 4'b0000 & r2 == 4'b0000 & r3 == 4'b0000 & r4 == 4'b0000) //4 left box full and three boxes to the right full |...
				| (r1 == 4'b0000 & r2 == 4'b0000 & r3 == 4'b0000 & r4 == 4'b0000) //5 all boxes are empty ....
				)
				begin
				new_box1 <= r1;
				new_box2 <= r2;
				new_box3 <= r3;
				new_box4 <= r4;
				end
				
			else if (r1 == 4'b0000 & r2 == 4'b0000 & r3 == 4'b0000 & r4 != 4'b0000) //6the right most bit is full all other boxes are empty ...|
				begin
				new_box1<= r4;
				new_box2<= 4'b0000;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end
				
			else if (r1 == 4'b0000 & r2 == 4'b0000 & r3 != 4'b0000 & r4 == 4'b0000) //7 ..|.
				begin
				new_box1<= r3;
				new_box2<= 4'b0000;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end
				
			else if (r1 == 4'b0000 & r2 == 4'b0000 & r3 != 4'b0000 & r4 != 4'b0000) //8 ..||
				begin
				new_box1<= r3;
				new_box2<= r4;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end
				
			else if (r1 == 4'b0000 & r2 != 4'b0000 & r3 == 4'b0000 & r4 == 4'b0000) //9 .|..
				begin
				new_box1<= r2;
				new_box2<= 4'b0000;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end
				
			else if (r1 == 4'b0000 & r2 != 4'b0000 & r3 == 4'b0000 & r4 != 4'b0000) //10 .|.|
				begin
				new_box1<= r2;
				new_box2<= r4;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end	
				
			else if (r1 == 4'b0000 & r2 != 4'b0000 & r3 != 4'b0000 & r4 == 4'b0000) //11 .||.
				begin
				new_box1<= r2;
				new_box2<= r3;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end
				
			else if (r1 == 4'b0000 & r2 != 4'b0000 & r3 != 4'b0000 & r4 != 4'b0000) //12 .|||
				begin
				new_box1<= r2;
				new_box2<= r3;
				new_box3<= r4;
				new_box4<= 4'b0000;
				end
			
			else if (r1 != 4'b0000 & r2 == 4'b0000 & r3 == 4'b0000 & r4 != 4'b0000) //13 |..|
				begin
				new_box1<= r1;
				new_box2<= r4;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end
			
			else if (r1 != 4'b0000 & r2 == 4'b0000 & r3 != 4'b0000 & r4 == 4'b0000) //14 |.|.
				begin
				new_box1<= r1;
				new_box2<= r3;
				new_box3<= 4'b0000;
				new_box4<= 4'b0000;
				end	
			
			else if (r1 != 4'b0000 & r2 == 4'b0000 & r3 != 4'b0000 & r4 != 4'b0000) //15 |.||
				begin
				new_box1<= r1;
				new_box2<= r3;
				new_box3<= r4;
				new_box4<= 4'b0000;
				end
				
			else if (r1 != 4'b0000 & r2 != 4'b0000 & r3 == 4'b0000 & r4 != 4'b0000) //16 ||.|
				begin
				new_box1<= r1;
				new_box2<= r2;
				new_box3<= r4;
				new_box4<= 4'b0000;
				end
		end
		assign b1= new_box1;
		assign b2= new_box2;
		assign b3= new_box3;
		assign b4= new_box4;
endmodule

module block_adder(r1, r2, r3, r4,clock, b1, b2, b3, b4);
	input [3:0] r1, r2, r3, r4;
	input clock;
	reg [3:0] new_box1, new_box2, new_box3, new_box4;
	output [3:0] b1, b2, b3, b4;
	
	always@(posedge clock)
		begin
			if (r1 != 4'b0000 & r2 != 4'b0000 & r3 != 4'b0000 & r4 != 4'b0000) //filledbox
			begin
				if (r1==r2 & r3 == r4)  //s1,s1, s2,s2
					begin
					new_box1 <= r1+r2;
					new_box2 <= r3+r4;
					new_box3 <= 4'b0000;
					new_box4 <= 4'b0000;
					end
				else if (r1==r2 & r3!=r4) // s,s,ns/s,ns   
					begin
					new_box1 <= r1+r2;
					new_box2 <= r3;
					new_box3 <= r4;
					new_box4 <= 4'b0000;
					end
				else if (r1!=r2 & r2!=r3 & r3!=r4 ) // ns,ns,ns,ns r1!=r2 & r2==r3 & r3==r4 ||r1!=r2 & r2==r3 & r3!=r4  
					begin
					new_box1 <= r1;
					new_box2 <= r2;
					new_box3 <= r3;
					new_box4 <= r4;
					end
				else if (r1!=r2 & r2==r3) //ns,s,s, ns/s
					begin
					new_box1 <= r1;
					new_box2 <= r2+r3;
					new_box3 <= r4;
					new_box4 <= 4'b0000;
					end
				else if (r1!=r2 & r2!=r3 & r3==r4) //ns,ns,s,s
					begin
					new_box1 <= r1;
					new_box2 <= r2;
					new_box3 <= r3+r4;
					new_box4 <= 4'b0000;
					end
			end
			else if (r1 != 4'b0000 & r2 != 4'b0000 & r3 != 4'b0000 & r4 == 4'b0000)
			begin
				if (r1 == r2) // s,s,s/ns,0
					begin
					new_box1 <= r1+r2;
					new_box2 <= r3;
					new_box3 <= 4'b0000;
					new_box4 <= 4'b0000;
					end
				else if (r1!=r2 & r2==r3) // ns,s,s   
					begin
					new_box1 <= r1;
					new_box2 <= r2+r3;
					new_box3 <= 4'b0000;
					new_box4 <= 4'b0000;
					end
				else if (r1!=r2 & r2!=r3) // ns,s,s   
					begin
					new_box1 <= r1;
					new_box2 <= r2;
					new_box3 <= r3;
					new_box4 <= 4'b0000;
					end
			end
			else if (r1 != 4'b0000 & r2 != 4'b0000 & r3 == 4'b0000 & r4 == 4'b0000)
			begin
				if (r1 == r2) // s,s,0,0
					begin
					new_box1 <= r1+r2;
					new_box2 <= 4'b0000;
					new_box3 <= 4'b0000;
					new_box4 <= 4'b0000;
					end
				if (r1 != r2) // s,s,0,0
					begin
					new_box1 <= r1;
					new_box2 <= r2;
					new_box3 <= 4'b0000;
					new_box4 <= 4'b0000;
					end
			end
			else if (r1 != 4'b0000 & r2 == 4'b0000 & r3 == 4'b0000 & r4 == 4'b0000)
			begin
				new_box1 <= r1;
				new_box2 <= 4'b0000;
				new_box3 <= 4'b0000;
				new_box4 <= 4'b0000;
			end
			else if (r1 == 4'b0000 & r2 == 4'b0000 & r3 == 4'b0000 & r4 == 4'b0000)
			begin
				new_box1 <= 4'b0000;
				new_box2 <= 4'b0000;
				new_box3 <= 4'b0000;
				new_box4 <= 4'b0000;
			end
		end
		assign b1= new_box1;
		assign b2= new_box2;
		assign b3= new_box3;
		assign b4= new_box4;
endmodule


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
	
	always @(*)
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
	
	always@(*)
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
	
	always@(*)
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
	always@(*)
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


