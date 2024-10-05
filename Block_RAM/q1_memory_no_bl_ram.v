`timescale 1ns/1ps

module memory_module;
    reg [7:0] data;
    reg reset;
    reg clk; //no testbench here for this code
    reg [7:0] memory[0:7]; //declare an 8-byte memory
    reg [2:0] address; //3 bit address
    integer file1;

    initial begin
        reset=1; #10;
        reset=0;
    end

    initial begin
        clk=0; address=3'b000;
        //read memory file init.dat. address locations given in memory starting with @
        $readmemb("init.dat", memory);
        //file1=$fopen("output.txt");

        $dumpfile ("mem_out.vcd"); 
        $dumpvars(0,memory_module);
    end

    // You only use begin... end for multi line blocks
    always #5 clk = ~clk;

    always @(posedge clk) begin
        if(reset)
            address=3'b000;
        else begin
            data=memory[address];
            $display("Memory [%0d] = %b", address, data);
            address=address+3'b001;
        end
    end

    //$fdisplay(file1,"Memory [%0d] = %b", address,data);
    //$fclose(file1);
    initial #800 $finish;
endmodule