module move(o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16, clock_iner, real_movement, real_movemen_t);
	input [3:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;
	wire [3:0] qt1,qt2,qt3,qt4,qt5,qt6,qt7,qt8,qt9,qt10,qt11,qt12,qt13,qt14,qt15,qt16;
	output [3:0] q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16;
	input clock_iner;
	input [1:0] real_movement;
	input real_movemen_t;
	move_up m1(.old_box1(o1),.old_box2(o2),.old_box3(o3),.old_box4(o4),.old_box5(o5),.old_box6(o6),.old_box7(o7),.old_box8(o8),.old_box9(o9),.old_box10(o10),.old_box11(o11),.old_box12(o12),.old_box13(o13),.old_box14(o14),.old_box15(o15),
	.old_box16(o16),.newbox1(qt1), .newbox2(qt2),.newbox3(qt3),.newbox4(qt4),.newbox5(qt5),.newbox6(qt6),.newbox7(qt7),.newbox8(qt8),.newbox9(qt9),.newbox10(qt10),.newbox11(qt11),.newbox12(qt12),.newbox13(qt13),.newbox14(qt14),.newbox15(qt15),.newbox16(qt16), .clock_in(clock_iner), .movement(real_movement[1:0]));
	 T_FF T1(
	  .t(q1),
	  .t2(qt1),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q1)
	  );
	 T_FF T2(
	  .t(q2),
	  .t2(qt2),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q2)
	  );
	 T_FF T3(
	  .t(q3),
	  .t2(qt3),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q3)
	  );
	 T_FF T4(
	  .t(q4),
	  .t2(qt4),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q4)
	  );
	 T_FF T5(
	  .t(q5),
	  .t2(qt5),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q5)
	  );
	 T_FF T6(
	  .t(q6),
	  .t2(qt6),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q6)
	  );
	 T_FF T8(
	  .t(q8),
	  .t2(qt8),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q8)
	  );
	 T_FF T7(
	  .t(q7),
	  .t2(qt7),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q7)
	  );
	 T_FF T9(
	  .t(q9),
	  .t2(qt9),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q9)
	  );
	 T_FF T10(
	  .t(q10),
	  .t2(qt10),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q10)
	  );
	 T_FF T11(
	  .t(q11),
	  .t2(qt11),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q11)
	  );
	 T_FF T12(
	  .t(q12),
	  .t2(qt12),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q12)
	  );
	 T_FF T13(
	  .t(q13),
	  .t2(qt13),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q13)
	  );
	 T_FF T14(
	  .t(q14),
	  .t2(qt14),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q14)
	  );
	 T_FF T15(
	  .t(q15),
	  .t2(qt15),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q15)
	  );
	 T_FF T16(
	  .t(q16),
	  .t2(qt16),
	  .clock(clock_iner), 
	  .reset(real_movemen_t), 
	  .q(q16)
	  );
endmodule
	
//Flip Flop
module T_FF(t,t2, clock, reset, q);
   input [3:0] t, t2;
	input clock, reset;
   output reg [3:0] q;
   always @ (posedge clock, negedge reset) //regular d flip flop
   begin
      if(reset == 1'b0)
      begin
         q <= t;
      end
      else
      begin
         q <= t2;
      end
   end
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
	
	always @(posedge clock_in)
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
		

		
