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
//////////////////////////////////////////////////////////////////////////////////


module counter_9(
    input clk_1Hz,
    input [31:0] counter_9_itself,
    input rst,
    output [31:0] count_9_output    
    );
    
    reg [31:0] count;

    initial begin
        count <= 0;
    end
    always @(posedge clk_1Hz or posedge rst) begin
        if(rst) begin
            count <= 0;
        end
        else if(counter_9_itself >= 9) begin
            count <= 0;
        end
        
        else begin
            count <= count + 1;
        end
    end
    
    assign count_9_output = count;
endmodule
