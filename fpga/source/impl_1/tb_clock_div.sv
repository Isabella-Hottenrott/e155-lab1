// Isabella Hottenrott
// tb_clock_div.sv
// ihottenrott@g.hmc.edu
// 25/9/2025
// Testbench for the clock divider to 2.4 Hz for E155 Lab 1

module tb_clock_div();
    logic clk, reset, test_int_osc, int_osc, led_hz;
    logic [31:0] errors, vectornum;
    
    
    clock_div dut(.int_osc(int_osc), .reset(reset), .led_hz(led_hz));


    always
        begin
            int_osc=1; #1;
            int_osc=0; #1;
			vectornum = vectornum+1;
        end
        
    initial begin
            test_int_osc=0; errors=0; reset=1; #20; reset=0;
            #20000000; test_int_osc=1; 
            #20000000; test_int_osc=0;  
            #20000000; test_int_osc=1;  
            #20000000; test_int_osc=0; 
            #20000000; test_int_osc=1; 
			#20000000; test_int_osc=0;  
            #20000000; test_int_osc=1;  
			#20000000; test_int_osc=0;  
            #20000000; test_int_osc=1;  
			#20000000; test_int_osc=0; 
			#100; $display("completed with %d errors", errors);
            $stop;
        end
        
    always @(posedge int_osc)
        if (reset) begin
            test_int_osc=0;
        end



endmodule