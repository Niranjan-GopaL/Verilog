module DFF_LED (
    input [2:0] D,  
    input clk,      
    input rst,      
    output reg [7:0] LED 
);

    reg [2:0] Q;  

    // On positive clock edge, if reset is high, reset the output. Otherwise, follow the 3-bit input D.
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 3'b000;  
        else
            Q <= D;       
    end

    // LED control logic
    always @(Q) begin
        LED = 8'b00000000;  // Default all LEDs off
        case (Q)
            3'b000: LED[0] = 1;  // LED 0 on when Q == 0
            3'b001: LED[1] = 1;  // LED 1 on when Q == 1
            3'b010: LED[2] = 1;  // LED 2 on when Q == 2
            3'b011: LED[3] = 1;  // LED 3 on when Q == 3
            3'b100: LED[4] = 1;  // LED 4 on when Q == 4
            3'b101: LED[5] = 1;  // LED 5 on when Q == 5
            3'b110: LED[6] = 1;  // LED 6 on when Q == 6
            3'b111: LED[7] = 1;  // LED 7 on when Q == 7
        endcase
    end

endmodule
