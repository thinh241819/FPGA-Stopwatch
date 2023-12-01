module counter_9_1st_digit(
    input clk_1Hz,
    input [31:0] counter_9_1st_digit_itself,
    input rst,
    input pause,
    output [31:0] counter_9_1st_digit_output    
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
            if(counter_9_1st_digit_itself >= 9) 
                count <= 0;
            else 
                count <= count + 1;
        end

    end
    
    assign counter_9_1st_digit_output = count;
endmodule