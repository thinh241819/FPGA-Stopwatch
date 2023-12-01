`timescale 1ns / 1ps

module tb_clock_1MHz_to_1Hz;

  reg clk_100M;
  reg rst;
  wire clk_1Hz;

  // Instantiate the clk_1m_1 module
  clock_1MHz_to_1Hz uut (
    .clk_100M(clk_100M),
    .rst(rst),
    .clk_1Hz(clk_1Hz)
  );

  // Clock generation for clk_100M (100MHz input clock)
  always begin
    #5 clk_100M = ~clk_100M; // Invert the clock every 5ns
  end

  initial begin
    // Initialize inputs
    clk_100M = 0;
    rst = 0;

    // Apply reset for a short time
    rst = 1;
    #50 rst = 0;

    // Simulate for a period of time
    repeat (600000000) begin // Simulate for 200 time units
      #5; // Advance time by 5ns

      // Print clock and clk_1Hz values to console

      //$display("Time = %0t, clk_100M = %b, rst = %b, clk_1Hz = %b", $time, clk_100M, rst, clk_1Hz);
    end

    // Finish simulation
    $finish;
  end

endmodule
