`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 11:10:01 PM
// Design Name: 
// Module Name: the_whole_clock
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


module the_whole_clock(
    // Inputs
    input clk,
    input BTNC,
    input BTNR,
    // Outputs
    output [6:0] seg,
    output [3:0] an
    );
    
    wire output_clk_1Hz;
    wire [6:0] segment;
    wire [3:0] an_output;
    
    // Counter 1st Digit
    wire [31:0] counter_1st_digit_output;
    wire [6:0] counter_1st_digit_encoded;
    
    // Counter 2nd Digit
    wire [31:0] counter_2nd_digit_output;
    wire [6:0] counter_2nd_digit_encoded;
    
    // Counter 3rd Digit
    wire [31:0] counter_3rd_digit_output;
    wire [6:0] counter_3rd_digit_encoded;

    // Counter 4th Digit
    wire [31:0] counter_4th_digit_output;
    wire [6:0] counter_4th_digit_encoded;
    
    // Buttons
    wire pause;
    wire rst;
    
        
    clock_1MHz_to_1Hz CLOCK_1HZ (
      .clk_100MHz (clk),
      .rst (rst),
      .clk_1Hz(output_clk_1Hz)
    );

    counter_9_1st_digit COUNTER_1ST_DIGIT (
        .clk_1Hz (output_clk_1Hz),
        .counter_9_1st_digit_itself (counter_1st_digit_output),
        .rst (rst),
        .pause (pause),
        .counter_9_1st_digit_output (counter_1st_digit_output)
    );
        
    counter_5_2nd_digit COUNTER_2ND_DIGIT (
        .clk_1Hz (output_clk_1Hz),
        .counter_5_2nd_digit_itself (counter_2nd_digit_output),
        .counter_9_1st_digit (counter_1st_digit_output),
        .rst (rst),
        .pause (pause),
        .counter_5_2nd_digit_output (counter_2nd_digit_output)
    );

    counter_9_3rd_digit COUNTER_3RD_DIGIT (
        .clk_1Hz (output_clk_1Hz),
        .counter_9_3rd_digit_itself (counter_3rd_digit_output),
        .counter_9_1st_digit (counter_1st_digit_output),
        .counter_5_2nd_digit (counter_2nd_digit_output),
        .rst (rst),
        .pause (pause),
        .counter_9_3rd_digit_output (counter_3rd_digit_output)
    );
    
     counter_5_4th_digit COUNTER_4TH_DIGIT (
        .clk_1Hz (output_clk_1Hz),
        .counter_5_4th_digit_itself (counter_4th_digit_output),
        .counter_9_1st_digit (counter_1st_digit_output),
        .counter_5_2nd_digit (counter_2nd_digit_output),
        .counter_9_3rd_digit (counter_3rd_digit_output),
        .rst (rst),
        .pause (pause),
        .counter_5_4th_digit_output (counter_4th_digit_output)
    );
    
    encoder ENCODER_1ST_DIGIT (
        .decimal_number (counter_1st_digit_output),
        .encoded (counter_1st_digit_encoded)
    );
    
     encoder ENCODER_2ND_DIGIT (
        .decimal_number (counter_2nd_digit_output),
        .encoded (counter_2nd_digit_encoded)
    );
    
    encoder ENCODER_3RD_DIGIT (
       .decimal_number (counter_3rd_digit_output),
       .encoded (counter_3rd_digit_encoded)
    );

    encoder ENCODER_4TH_DIGIT (
        .decimal_number (counter_4th_digit_output),
        .encoded (counter_4th_digit_encoded)
    );

    number_to_7_segment DISPLAY(
        .clk_100MHz (clk),
        .digit_1_encoded (counter_1st_digit_encoded),
        .digit_2_encoded (counter_2nd_digit_encoded),
        .digit_3_encoded (counter_3rd_digit_encoded),
        .digit_4_encoded (counter_4th_digit_encoded),
        .seg (segment),
        .an (an_output)
    );
    
    button_and_switches BTN_SW(
        .clk_100MHz (clk),
        .BTNC (BTNC),
        .BTNR (BTNR),
        .pause (pause),
        .rst (rst)
    );
    
    assign seg = segment;
    assign an = an_output;
endmodule
