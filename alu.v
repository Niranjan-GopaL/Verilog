`timescale 1ns / 1ps


module alu(a, b,c,d,carryin, select, P,clk);

    // 18 and 48 bit inputs
    input [17:0] a, b, d;
    input [47:0] c;

    input carryin,clk;

    // 2 bit select line
    input [1:0] select;
    output reg [47:0]P;

    always @(posedge clk) 
    begin
        case (select)
            'd0: P = {30'b0, a} + {30'b0, b};       //  Add      ; a + b 
            'd1: P = {30'b0, a} - {30'b0, b};       //  Subtract ; a - b
            'd2: P = c + {30'b0, a} + carryin;      //  Add      ; c + a + carryin 
            'd3: P = {30'b0, d} ^ {30'b0, a};       //  XOR      ; a ^ d ( gives 0 if same bits ) 
            default: P = 48'b0;                      
        endcase
    end

endmodule