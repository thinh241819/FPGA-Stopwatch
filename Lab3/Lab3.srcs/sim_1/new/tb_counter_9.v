`timescale 1ns / 1ps

module tb_counter_9;

  reg clk_1Hz;
  reg rst;
  wire [31:0] count_9_output;
  
  counter_9 uut (
    .clk_1Hz (clk_1Hz),
    .counter_9_itself (count_9_output),
    .rst (rst),
    .count_9_output (count_9_output)
  );

  // Clock generation for clk_100M (100MHz input clock)
  always begin
    #5 clk_1Hz = ~clk_1Hz; // Invert the clock every 5ns
  end

  initial begin
    // Initialize inputs
    clk_1Hz = 0;
    rst = 0;

    // Apply reset for a short time
    rst = 1;
    #50 
    rst = 0;

    // Simulate for a period of time
//    repeat (600000000) begin // Simulate for 200 time units
//      #5; // Advance time by 5ns

//      // Print clock and clk_1Hz values to console

//      //$display("Time = %0t, clk_100M = %b, rst = %b, clk_1Hz = %b", $time, clk_100M, rst, clk_1Hz);
//    end

    // Finish simulation
    $finish;
  end

endmodule
