`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 07:19:35 PM
// Design Name: 
// Module Name: counter_5_2nd_digit
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


module counter_5_2nd_digit(
    input clk_1Hz,
    input [31:0] counter_5_2nd_digit_itself,
    input [31:0] counter_9_1st_digit,
    input rst,
    input pause,
    output [31:0] counter_5_2nd_digit_output    
);
    
    reg [31:0] count;
    
    initial begin
        count <= 0;
    end
    always @(posedge clk_1Hz or posedge rst) begin
        if(rst) begin
            count <= 0;
        end
        else if (pause == 0) begin
            if(counter_5_2nd_digit_itself >= 5 && counter_9_1st_digit >= 9)
                count <= 0;        
            else if (counter_9_1st_digit >= 9) 
                count <= count + 1;
        end

    end
    
    assign counter_5_2nd_digit_output = count;
endmodule
