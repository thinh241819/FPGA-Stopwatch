`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 12:13:13 PM
// Design Name: 
// Module Name: counter_9
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


module counter_5(
    input clk_1Hz,
    input [31:0] counter_5_itself,
    input rst,
    output [31:0] count_5_output    
    );
    
    reg [31:0] count;

    initial begin
        count <= 0;
    end   
    always @(posedge clk_1Hz or posedge rst) begin
        if(rst) begin
            count <= 0;
        end
        else if(counter_5_itself == 5) begin
            count <= 0;
        end
        
        else begin
            count <= count + 1;
        end
    end
    
    assign count_5_output = count;
endmodule
