`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 10:43:31 PM
// Design Name: 
// Module Name: button_and_switches
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


module button_and_switches(
    input clk_100MHz,
    input BTNC,
    input BTNR,
    output pause,
    output rst
    );
    
    wire arst;
    wire pause_btn;
    reg pause_output;
    reg pause_output_d;
    reg reset;
    
    wire [22:0] clk_dv_inc;
    reg [21:0]  clk_dv;
    reg         clk_en;
    reg         clk_en_d;
    
    
    initial begin
        pause_output = 0;
        pause_output_d = 0;
    end
    assign arst = BTNR;
    // Asynchronous Reset
    always @(posedge clk_100MHz or posedge arst) begin 
        if(arst)
            reset <= 1;
        else
            reset <= 0;
    end
    
    // Debouncing 
    always @(posedge clk_100MHz) begin
        if (arst) begin
            clk_dv   <= 0;
            clk_en   <= 1'b0;
            clk_en_d <= 1'b0;           
        end
        else begin
            clk_dv   <= clk_dv_inc[21:0];
            clk_en   <= clk_dv_inc[22];
            clk_en_d <= clk_en;
        end
    end
    
    assign pause_btn = BTNC;
    always @(posedge clk_100MHz) begin
        if (arst) begin
            pause_output = 0;
        end
        else if (clk_en) begin
            if (pause_btn) begin
                pause_output <= ~pause_output;
                pause_output_d <= pause_output;
            end
        end
    end
    
    
    assign clk_dv_inc = clk_dv + 1;
    assign pause = pause_output_d;
    assign rst = reset;
    
endmodule
