module variable_counter(reset, CLOCK_50, outvalue);
    input reset;
    input CLOCK_50;
    output [3:0] outvalue;
    t_ff T0( //toggle flip flops
       .enable(1'b1), 
       .clock(CLOCK_50), 
       .reset(reset),
       .q(outvalue)
       );
endmodule

module t_ff(enable, clock, reset, q);
    input enable, clock, reset;
    output reg [3:0] q;

    always @(posedge clock)
    begin
        if(reset == 1'b1) //reset when high
        begin
            q <= 4'b0000;
        end
        else if(q > 4'b1111) //when hex display reaches F reset
            q <= 0;
        else if(enable == 1'b1) //counts upwards for hex value
            q <= q + 4'b0001;
    end
endmodule

