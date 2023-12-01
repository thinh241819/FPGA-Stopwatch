`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// This module is a combinatoric circuit that encode decimal number into encoding for 7 segment display
//////////////////////////////////////////////////////////////////////////////////


module encoder(
    input [31:0] decimal_number,
    output [6:0] encoded
    );
    
    reg [6:0] encode_result;
    always @* begin // always@* means always combinatorial block
        if (decimal_number == 0) begin
            encode_result = ~7'b1111110;
        end
        else if (decimal_number == 1)
            encode_result = ~7'b0110000;
        else if (decimal_number == 2)
            encode_result = ~7'b1101101;
        else if (decimal_number == 3)
            encode_result = ~7'b1111001;
        else if (decimal_number == 4)
            encode_result = ~7'b0110011;
        else if (decimal_number == 5)
            encode_result = ~7'b1011011;
        else if (decimal_number == 6)
            encode_result = ~7'b1011111;
        else if (decimal_number == 7)
            encode_result = ~7'b1110000;
        else if (decimal_number == 8)
            encode_result = ~7'b1111111;
        else if (decimal_number == 9)
            encode_result = ~7'b1111011;
            
    end
    
    assign encoded = encode_result;
endmodule
