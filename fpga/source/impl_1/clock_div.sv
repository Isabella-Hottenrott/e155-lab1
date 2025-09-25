// Isabella Hottenrott
// tenth_clock.sv
// ihottenrott@g.hmc.edu
// 25/9/2025
// Module containing Verilog code for clock division to 2.4 Hz.

module clock_div(input logic int_osc,
					input logic reset,
					output logic led_hz);
	
		logic [24:0] counter;
	 
	  
	   always_ff @(posedge int_osc, negedge reset) begin
		if (reset) begin
			counter <= 25'b0;
			led_hz <= 1'b0;
			end
        else if (counter == 25'd9_999_999) begin
            counter <= 25'd0;
            led_hz <= ~led_hz; 
        end else begin
            counter <= counter + 1;
        end
    end


endmodule
