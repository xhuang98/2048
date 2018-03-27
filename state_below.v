module state_below(ctl, CLOCKTR, clocke, bar1, bar2,bar3,bar4,bar5,bar6,bar7,bar8,bar9,bar10,bar11,bar12,bar13,bar14,bar15,bar16,bart1, bart2,bart3,bart4,bart5,bart6,bart7,bart8,bart9,bart10,bart11,bart12,bart13,bart14,bart15,bart16, select);
	input [3:0] bar1, bar2,bar3,bar4,bar5,bar6,bar7,bar8,bar9,bar10,bar11,bar12,bar13,bar14,bar15,bar16;
	wire [3:0] ar1, ar2,ar3,ar4,ar5,ar6,ar7,ar8,ar9,ar10,ar11,ar12,ar13,ar14,ar15,ar16;
	wire [3:0] or1, or2,or3,or4,or5,or6,or7,or8,or9,or10,or11,or12,or13,or14,or15,or16;
	reg [3:0] ror1, ror2,ror3,ror4,ror5,ror6,ror7,ror8,ror9,ror10,ror11,ror12,ror13,ror14,ror15,ror16;
	output [3:0] bart1, bart2,bart3,bart4,bart5,bart6,bart7,bart8,bart9,bart10,bart11,bart12,bart13,bart14,bart15,bart16;
	input CLOCKTR;
	input [2:0]ctl;
	input clocke;
	wire random_select_mux;
	wire other_select_mux;
	wire [3:0] qout;
	wire [3:0] storedvalueout;
	output [1:0] select;
	// count_up is set to zero when ctrl1 is 1
	//regFF is set to zero when ctrl1 is 1
	//if ctrl[2] is 0 then maintain the next_state after the random tile placement otherwise if ctrl[2] is 1 then find the next next state
	// 100 qout = 4'b000
	// 101
	// 110
	// 111
	count_up v1(.enable(1'B1),.clock(CLOCKTR),.reset(ctl[1]),.q(qout));
   regFF new0(
       .t(qout),
       .clock(clocke), 
       .reset(ctl[1]), 
       .q(storedvalueout)
       );
	
	random_numb rap1(.outvalue(storedvalueout),.clock_inere(clocke), .b1(bar1), .b2(bar2), .b3(bar3),.b4(bar4),.b5(bar5),.b6(bar6),.b7(bar7),
	.b8(bar8),.b9(bar9),.b10(bar10),.b11(bar11),.b12(bar12),.b13(bar13),.b14(bar14), .b15(bar15), .b16(bar16),
	.o1(ar1),.o2(ar2),.o3(ar3),.o4(ar4),.o5(ar5),.o6(ar6),.o7(ar7),.o8(ar8),.o9(ar9),.o10(ar10),.o11(ar11),.o12(ar12),.o13(ar13),.o14(ar14),.o15(ar15),.o16(ar16),
	.real_movemen(ctl[2]), .mux_rand(random_select_mux));
	
	other_numb ark1(.clock_inere(clocke), .b1(bar1), .b2(bar2), .b3(bar3),.b4(bar4),.b5(bar5),.b6(bar6),.b7(bar7),
	.b8(bar8),.b9(bar9),.b10(bar10),.b11(bar11),.b12(bar12),.b13(bar13),.b14(bar14), .b15(bar15), .b16(bar16),
	.o1(or1),.o2(or2),.o3(or3),.o4(or4),.o5(or5),.o6(or6),.o7(or7),.o8(or8),.o9(or9),.o10(or10),.o11(or11),.o12(or12),.o13(or13),.o14(or14),.o15(or15),.o16(or16)
	,.real_movemen(ctl[2]), .mux_other(other_select_mux));

	
	assign select = {other_select_mux, random_select_mux};
	always@(*)
	begin
		case(select)
			0: begin
				ror1 <= bar1;
				ror2 <= bar2;
				ror3 <= bar3;
				ror4 <= bar4;
				ror5 <= bar5;
				ror6 <= bar6;
				ror7 <= bar7;
				ror8 <= bar8;
				ror9 <= bar9;
				ror10 <= bar10;
				ror11 <= bar11;
				ror12 <= bar12;
				ror13 <= bar13;
				ror14 <= bar14;
				ror15 <= bar15;
				ror16 <= bar16;
				end
			1: begin
				ror1 <= bar1;
				ror2 <= bar2;
				ror3 <= bar3;
				ror4 <= bar4;
				ror5 <= bar5;
				ror6 <= bar6;
				ror7 <= bar7;
				ror8 <= bar8;
				ror9 <= bar9;
				ror10 <= bar10;
				ror11 <= bar11;
				ror12 <= bar12;
				ror13 <= bar13;
				ror14 <= bar14;
				ror15 <= bar15;
				ror16 <= bar16;
				end
			2: begin
				ror1 <= or1;
				ror2 <= or2;
				ror3 <= or3;
				ror4 <= or4;
				ror5 <= or5;
				ror6 <= or6;
				ror7 <= or7;
				ror8 <= or8;
				ror9 <= or9;
				ror10 <= or10;
				ror11 <= or11;
				ror12 <= or12;
				ror13 <= or13;
				ror14 <= or14;
				ror15 <= or15;
				ror16 <= or16;
				end
			3: begin
				ror1 <= ar1;
				ror2 <= ar2;
				ror3 <= ar3;
				ror4 <= ar4;
				ror5 <= ar5;
				ror6 <= ar6;
				ror7 <= ar7;
				ror8 <= ar8;
				ror9 <= ar9;
				ror10 <= ar10;
				ror11 <= ar11;
				ror12 <= ar12;
				ror13 <= ar13;
				ror14 <= ar14;
				ror15 <= ar15;
				ror16 <= ar16;
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
				
module regFF(t, clock, reset, q);
   input [3:0] t;
	input clock, reset;
   output reg [3:0] q;
   always @ (posedge clock)
   begin
      if(reset == 1'b1)
      begin
         q <= 4'b0000;
      end
      else
      begin
         q <= t;
      end
   end
endmodule


	
module count_up(enable, clock, reset, q);
    input enable, clock, reset;
    output reg [3:0] q;
	 wire [3:0] ku;
	 assign ku = 4'b0001;
    always @(posedge clock)
    begin
        if(reset == 1'b1) //reset when high
        begin
            q <= 4'b0000;
        end
        else if(q > 4'b1111) //when hex display reaches F reset
            q <= 4'b0000;
        else if(enable == 1'b1) //counts upwards for hex value
            q <= q + ku;
    end
endmodule	

module other_numb(clock_inere, b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,real_movemen, mux_other);
	input [3:0] b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16;	
	wire [3:0] k1, k2, k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14, k15, k16;	
	output [3:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;
	output mux_other;
	input clock_inere;
	input real_movemen;
	other_checker r1(.box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16),.boxy1(k1),.boxy2(k2),.boxy3(k3),.boxy4(k4),.boxy5(k5),.boxy6(k6),.boxy7(k7),.boxy8(k8),.boxy9(k9),.boxy10(k10),.boxy11(k11),.boxy12(k12),.boxy13(k13),.boxy14(k14),.boxy15(k15),.boxy16(k16), .mux_other(mux_other), .clock(clock_inere));
	
	 T_FF T1(
	  .t(o1),
	  .t2(k1),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o1)
	  );
	 T_FF T2(
	  .t(o2),
	  .t2(k2),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o2)
	  );
	 T_FF T3(
	  .t(o3),
	  .t2(k3),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o3)
	  );
	 T_FF T4(
	  .t(o4),
	  .t2(k4),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o4)
	  );
	 T_FF T5(
	  .t(o5),
	  .t2(k5),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o5)
	  );
	 T_FF T6(
	  .t(o6),
	  .t2(k6),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o6)
	  );
	 T_FF T8(
	  .t(o8),
	  .t2(k8),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o8)
	  );
	 T_FF T7(
	  .t(o7),
	  .t2(k7),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o7)
	  );
	 T_FF T9(
	  .t(o9),
	  .t2(k9),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o9)
	  );
	 T_FF T10(
	  .t(o10),
	  .t2(k10),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o10)
	  );
	 T_FF T11(
	  .t(o11),
	  .t2(k11),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o11)
	  );
	 T_FF T12(
	  .t(o12),
	  .t2(k12),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o12)
	  );
	 T_FF T13(
	  .t(o13),
	  .t2(k13),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o13)
	  );
	 T_FF T14(
	  .t(o14),
	  .t2(k14),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o14)
	  );
	 T_FF T15(
	  .t(o15),
	  .t2(k15),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o15)
	  );
	 T_FF T16(
	  .t(o16),
	  .t2(k16),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o16)
	  );	
endmodule	

module other_checker (clock,box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16,boxy1, boxy2, boxy3,boxy4,boxy5,boxy6,boxy7,boxy8,boxy9,boxy10,boxy11,boxy12,boxy13,boxy14, boxy15, boxy16, mux_other);
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

module random_numb(outvalue,clock_inere, b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,real_movemen, mux_rand);
	input [3:0] b1, b2, b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14, b15, b16;	
	wire [3:0] k1, k2, k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14, k15, k16;	
	output [3:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;
	output mux_rand;
	input [3:0] outvalue;
	input clock_inere;
	input real_movemen;
	
	random_number_grabber r0(.randombox(outvalue), .box1(b1), .box2(b2), .box3(b3),.box4(b4),.box5(b5),.box6(b6),.box7(b7),.box8(b8),.box9(b9),
	.box10(b10),.box11(b11),.box12(b12),.box13(b13),.box14(b14), .box15(b15), .box16(b16),.q1(k1),.q2(k2),.q3(k3),.q4(k4),.q5(k5),.q6(k6),.q7(k7),.q8(k8),.q9(k9),.q10(k10),.q11(k11),.q12(k12),.q13(k13),.q14(k14),.q15(k15),.q16(k16),.clock(clock_inere), .muxy(mux_rand));
	
	 T_FF T1(
	  .t(o1),
	  .t2(k1),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o1)
	  );
	 T_FF T2(
	  .t(o2),
	  .t2(k2),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o2)
	  );
	 T_FF T3(
	  .t(o3),
	  .t2(k3),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o3)
	  );
	 T_FF T4(
	  .t(o4),
	  .t2(k4),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o4)
	  );
	 T_FF T5(
	  .t(o5),
	  .t2(k5),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o5)
	  );
	 T_FF T6(
	  .t(o6),
	  .t2(k6),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o6)
	  );
	 T_FF T8(
	  .t(o8),
	  .t2(k8),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o8)
	  );
	 T_FF T7(
	  .t(o7),
	  .t2(k7),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o7)
	  );
	 T_FF T9(
	  .t(o9),
	  .t2(k9),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o9)
	  );
	 T_FF T10(
	  .t(o10),
	  .t2(k10),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o10)
	  );
	 T_FF T11(
	  .t(o11),
	  .t2(k11),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o11)
	  );
	 T_FF T12(
	  .t(o12),
	  .t2(k12),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o12)
	  );
	 T_FF T13(
	  .t(o13),
	  .t2(k13),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o13)
	  );
	 T_FF T14(
	  .t(o14),
	  .t2(k14),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o14)
	  );
	 T_FF T15(
	  .t(o15),
	  .t2(k15),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o15)
	  );
	 T_FF T16(
	  .t(o16),
	  .t2(k16),
	  .clock(clock_inere), 
	  .reset(real_movemen), 
	  .q(o16)
	  );	
endmodule
	
module random_number_grabber(randombox,clock,box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16, q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16, muxy);
	input [3:0] box1, box2, box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14, box15, box16;
	reg [3:0] qt1,qt2,qt3,qt4,qt5,qt6,qt7,qt8,qt9,qt10,qt11,qt12,qt13,qt14,qt15,qt16;
	output [3:0] q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16;
	reg q;
	input clock;
	input [3:0] randombox;
	output muxy;
	
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

module T_FF(t,t2, clock, reset, q);
   input [3:0] t, t2;
   input clock, reset;
   output reg [3:0] q;
   always @ (posedge clock) //regular d flip flop
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
