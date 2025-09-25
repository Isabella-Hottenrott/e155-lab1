// Isabella Hottenrott
// tb_segments.sv
// ihottenrott@g.hmc.edu
// 24/9/2025
// Testbench for the segments module for E155 Lab 1

module tb_segments();
	logic clk, reset;
    logic [3:0] digit;
    logic [6:0] segs, sexpected;
	logic [4:0] vectornum, errors;
	
	
	segments dut (.digit(digit), .segs(segs));


	always
		begin
			clk=1; #5;
			clk=0; #5;
		end
		
	initial begin
			vectornum=5'd0; errors=0; reset=1; #22; reset=0;
			
			vectornum=5'd1; digit=4'b0000; sexpected=7'b000_0001; #10;
			vectornum=5'd2; digit=4'b0001; sexpected=7'b100_1111; #10;
			vectornum=5'd3; digit=4'b0010; sexpected=7'b001_0010; #10;
			vectornum=5'd4; digit=4'b0011; sexpected=7'b000_0110; #10;
			vectornum=5'd5; digit=4'b0100; sexpected=7'b100_1100; #10;
			vectornum=5'd6; digit=4'b0101; sexpected=7'b010_0100; #10;
			vectornum=5'd7; digit=4'b0110; sexpected=7'b010_0000; #10;
			vectornum=5'd8; digit=4'b0111; sexpected=7'b000_1111; #10;
			vectornum=5'd9; digit=4'b1000; sexpected=7'b000_0000; #10;
			vectornum=5'd10; digit=4'b1001; sexpected=7'b000_1100; #10;
			vectornum=5'd11; digit=4'b1010; sexpected=7'b000_1000; #10;
			vectornum=5'd12; digit=4'b1011; sexpected=7'b110_0000; #10;
			vectornum=5'd13; digit=4'b1100; sexpected=7'b011_0001; #10;
			vectornum=5'd14; digit=4'b1101; sexpected=7'b100_0010; #10;
			vectornum=5'd15; digit=4'b1110; sexpected=7'b011_0000; #10;
			vectornum=5'd16; digit=4'b1111; sexpected=7'b011_1000; #10;
			$display("completed with %d errors", errors);
			$stop;
		end
		

	always @(negedge clk)
		if (~reset) begin
			if (segs !== sexpected) begin
				$display("Error: inputs = %b", {digit});
				$display(" output = %b (%b expected)", segs, sexpected);
				$display(" on test = %d ", vectornum);
				errors = errors + 1;
			end

end 
endmodule