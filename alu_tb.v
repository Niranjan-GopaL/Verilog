`timescale 1ns / 1ps
`include "alu.v"


module alu_tb;

    // Testbench inputs
    reg [17:0] a, b, d;
    reg [47:0] c;
    reg carryin, clk;
    reg [1:0] select;

    // Output from the ALU
    wire [47:0] P;

    // Instantiate the ALU module
    alu uut (
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d), 
        .carryin(carryin), 
        .select(select), 
        .P(P),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock
    end

    // Test vectors
    initial begin
        // Initialize inputs
        a = 18'b000000000000000011; // a = 3
        b = 18'b000000000000000101; // b = 5
        c = 48'b000000000000000000000000000000000000001000000000; // c = 1024
        d = 18'b000000000000001010; // d = 10
        carryin = 1'b0;

        // Apply test cases
        // Test case 1: Add a and b
        select = 2'b00;
        #10;
        $display("Select = %b, P = %d (Expected = 8)", select, P);

        // Test case 2: Subtract b from a
        select = 2'b01;
        #10;
        $display("Select = %b, P = %d (Expected = -2)", select, P);

        // Test case 3: Add c and a with carryin
        carryin = 1'b1;
        select = 2'b10;
        #10;
        $display("Select = %b, P = %d (Expected = 1028)", select, P);

        // Test case 4: XOR a and d
        select = 2'b11;
        #10;
        $display("Select = %b, P = %d (Expected = 9)", select, P);

        // Finish the simulation
        $finish;
    end

endmodule
