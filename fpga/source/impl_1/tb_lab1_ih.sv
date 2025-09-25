// Isabella Hottenrott
// tb_lab1_ih.sv
// ihottenrott@g.hmc.edu
// 9/9/2025
// Testbench for the clock divider to 60 Hz for E155 Lab 2

module tb_lab1_ih();
    logic clk, reset, test_int_osc, int_osc, led_hz;
	logic [2:0] led;
	logic led1exp, led2exp, led1, led2;
	logic [6:0] segs, sexpected;
	logic [3:0] s, digit;
    logic [31:0] errors, vectornum;
    
    
    lab1_ih dut(.s(s), .led(led), .segs(segs));

`timescale 1ns/1ns;

assign led1 = led[0];
assign led2 = led[1];
   assign clk = dut.int_osc;
        
    initial begin
			vectornum=5'd0; errors=0; reset=1; #22; reset=0;
			
			vectornum=5'd1; s=4'b0000; sexpected=7'b000_0001; led1exp = 0; led2exp =0 ; #10;
			vectornum=5'd2; s=4'b0001; sexpected=7'b100_1111; led1exp =1 ; led2exp =0 ; #10;
			vectornum=5'd3; s=4'b0010; sexpected=7'b001_0010; led1exp = 1; led2exp = 0; #10;
			vectornum=5'd4; s=4'b0011; sexpected=7'b000_0110; led1exp = 0; led2exp =0 ; #10;
			vectornum=5'd5; s=4'b0100; sexpected=7'b100_1100;led1exp = 0; led2exp =0 ;  #10;
			vectornum=5'd6; s=4'b0101; sexpected=7'b010_0100; led1exp = 1; led2exp =0 ; #10;
			vectornum=5'd7; s=4'b0110; sexpected=7'b010_0000; led1exp = 1; led2exp =0 ; #10;
			vectornum=5'd8; s=4'b0111; sexpected=7'b000_1111; led1exp = 0; led2exp =0 ; #10;
			vectornum=5'd9; s=4'b1000; sexpected=7'b000_0000; led1exp = 0; led2exp =0 ; #10;
			vectornum=5'd10; s=4'b1001; sexpected=7'b000_1100;led1exp = 1; led2exp =0 ;  #10;
			vectornum=5'd11; s=4'b1010; sexpected=7'b000_1000; led1exp = 1; led2exp = 0; #10;
			vectornum=5'd12; s=4'b1011; sexpected=7'b110_0000; led1exp = 0; led2exp = 0; #10;
			vectornum=5'd13; s=4'b1100; sexpected=7'b011_0001; led1exp = 0; led2exp = 1; #10;
			vectornum=5'd14; s=4'b1101; sexpected=7'b100_0010; led1exp = 1; led2exp = 1; #10;
			vectornum=5'd15; s=4'b1110; sexpected=7'b011_0000;led1exp = 1; led2exp =1 ;  #10;
			vectornum=5'd16; s=4'b1111; sexpected=7'b011_1000; led1exp = 0; led2exp = 1; #10;
			#100; $display("completed with %d errors", errors);
            $stop;
        end
        
    always @(negedge int_osc)
        if ((segs !== sexpected) || (led1 !== led1exp) || (led2 !== led2exp))
			begin $display("error on vector %d", vectornum);
				end



endmodule