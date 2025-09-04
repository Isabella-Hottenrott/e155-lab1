// Isabella Hottenrott
// segments.sv
// ihottenrott@g.hmc.edu
// 1/9/2025
// Module containing Verilog code for Seven-segment display mapping

module segments(input logic [3:0] digit,
                output logic [6:0] segs);

always_comb
    case(digit)
        0:  segs = 7'b000_0001;
        1:  segs = 7'b100_1111;
        2:  segs = 7'b001_0010;
        3:  segs = 7'b000_0110;
        4:  segs = 7'b100_1100;
        5:  segs = 7'b010_0100;
        6:  segs = 7'b010_0000;
        7:  segs = 7'b000_1111;
        8:  segs = 7'b000_0000;
        9:  segs = 7'b000_1100;
        default:    segs = 7'b111_1111;
    endcase
endmodule