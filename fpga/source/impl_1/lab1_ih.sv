// Isabella Hottenrott
// lab1_ih.sv
// ihottenrott@g.hmc.edu
// 1/9/2025
// Top level module for E155 Lab 1: FPGA and MCU Setup and Testing


module lab1_ih(
            input logic [3:0] s,
            output logic [2:0] led,
            output logic [6:0] segs);
			
		//logic tenth_hz, int_osc;
		logic int_osc, tenth_hz;	
		
			   // Internal high-speed oscillator
		HSOSC #(.CLKHF_DIV(2'b00)) 
			hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

		clock_div CLOCK (.int_osc(int_osc), .led_hz(led_hz));

	   // Assign LED 2 output
	    assign led[0] = s[0]^s[1];
		assign led[1] = s[2]&s[3];
		assign led[2] = led_hz;
		
		segments SEGMENTS (.digit(s), .segs(segs));
		
		
endmodule