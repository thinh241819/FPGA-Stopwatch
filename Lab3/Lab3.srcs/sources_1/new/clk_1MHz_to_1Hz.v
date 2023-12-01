`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 01:28:59 AM
// Design Name: 
// Module Name: clock_1mhz_to_1hz
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


module clock_1MHz_to_1Hz(
    input clk_100MHz,
    input rst,
    output clk_1Hz,
    output clk_2Hz,
    output clk_700Hz,
    output clk_1_3Hz
    );

reg [31:0] count_1Hz;
reg [31:0] count_2Hz;
reg [31:0] count_700Hz;
reg [31:0] count_1_3Hz;
reg clk_1Hz_reg;
reg clk_2Hz_reg;
reg clk_700Hz_reg;
reg clk_1_3Hz_reg;

initial begin
    count_1Hz = 0;
    count_2Hz = 0;
    count_700Hz = 0;
    count_1_3Hz = 0;
    clk_1Hz_reg = 0;
    clk_2Hz_reg = 0;
    clk_700Hz_reg = 0;
    clk_1_3Hz_reg = 0;    
end
always @(posedge clk_100MHz or posedge rst) begin
    if (rst) begin
            count_1Hz <= 0;
            count_2Hz <= 0;
            count_700Hz <= 0;
            count_1_3Hz <= 0;
            clk_1Hz_reg <= 0;
            clk_2Hz_reg <= 0;
            clk_700Hz_reg <= 0;
            clk_1_3Hz_reg <= 0;
    end
    else begin
        if (count_1Hz == 50_000_000-1) begin
            count_1Hz <= 0;
            clk_1Hz_reg <= ~clk_1Hz_reg; // Toggle the clk_1Hz_reg each time count reaches 100,000,000.
        end
        else
            count_1Hz <= count_1Hz + 1;

        if (count_2Hz == 25_000_000-1) begin
            count_2Hz <= 0;
            clk_2Hz_reg <= ~clk_2Hz_reg; // Toggle the clk_1Hz_reg each time count reaches 100,000,000.
        end
        else
            count_2Hz <= count_2Hz + 1;
        
        if (count_1_3Hz == 38_461_000-1) begin
            count_1_3Hz <= 0;
            clk_1_3Hz_reg <= ~clk_1_3Hz_reg; // Toggle the clk_1Hz_reg each time count reaches 100,000,000.
        end     
        else
             count_1_3Hz <= count_1_3Hz + 1;
             
        if (count_700Hz == 71_500-1) begin
            count_700Hz <= 0;
            clk_700Hz_reg <= ~clk_700Hz_reg; // Toggle the clk_1Hz_reg each time count reaches 100,000,000.
        end        
        else
            count_700Hz <= count_700Hz + 1;
    end
end

assign clk_1Hz = clk_1Hz_reg;
assign clk_2Hz = clk_2Hz_reg;
assign clk_700Hz = clk_700Hz_reg;
assign clk_1_3Hz = clk_1_3Hz_reg;
endmodule
