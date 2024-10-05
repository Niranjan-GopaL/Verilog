module mux4to1(
    input wire [1:0] sel,     
    input wire [3:0] in,      
    output reg out          
);

always @(*) begin
    case (sel)
        2'b00: out = in[0];   // If sel is 00, choose in[0]
        2'b01: out = in[1];   // If sel is 01, choose in[1]
        2'b10: out = in[2];   // If sel is 10, choose in[2]
        2'b11: out = in[3];   // If sel is 11, choose in[3]
        default: out = 1'b0;  // Default case
    endcase
end

endmodule
