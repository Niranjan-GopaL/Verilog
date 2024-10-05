module DFF (D, clk, rst, Q);

    input D;  
    input clk; 
    input rst; 

    output reg Q;

    // On +ve clock edge, if reset is high, reset the output. Otherwise, follow D input.
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;  // Resets output to 0
        else
            Q <= D;     // Set Q to the input D
    end

endmodule