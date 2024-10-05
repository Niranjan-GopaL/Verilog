`timescale 1ns / 1ps

module blinking_led_tb();
    reg clk;
    wire led;
    
    led_blink dut(clk, led);
    
    always
    #5 clk = ~clk;

    initial
        begin
            clk = 0;
            #20;
        end

endmodule