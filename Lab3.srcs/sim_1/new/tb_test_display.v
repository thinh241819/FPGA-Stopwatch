`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 03:33:22 AM
// Design Name: 
// Module Name: tb_test_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_test_display;

reg clock;
wire [6:0] seg;
wire [3:0] an;

test_display uut(
    .clk (clock),
    .seg (seg),
    .an (an)
);
endmodule
