`include "dff.v" 

module tb_DFF;

    // Declare inputs and outputs as reg/wire
    reg D;
    reg clk;
    reg rst;
    wire Q;

    
    // Instantiate the D Flip-Flop module
    DFF uut (
        .D(D),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    // Generate clock with a period of 10 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test cases
    initial begin
        // Initialize inputs
        D = 0;
        rst = 1;  // Start with reset active

        // After some time, release reset and apply test cases
        #10 rst = 0;
        #10 D = 1;  // Apply D = 1, observe Q after next clock edge
        #10 D = 0;  // Apply D = 0, observe Q after next clock edge
        #10 D = 1;  // Apply D = 1 again

        // Reset the flip-flop
        #10 rst = 1;
        #10 rst = 0;
        #10 D = 0;

        // Finish the simulation
        #30 $finish;
    end

    // Monitor signals to observe the output changes
    initial begin
        $monitor("Time = %0d, D = %b, rst = %b, Q = %b", $time, D, rst, Q);
    end

endmodule