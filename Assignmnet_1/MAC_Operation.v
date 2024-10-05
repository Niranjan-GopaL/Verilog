`timescale 1ns / 1ps

module MAC_Operation(clk);
    input clk;
    
    wire [7:0] inputs[2:0] ;
    wire [16:0] out;
    
    dsp_macro_0 dsp (
      .CLK(clk),  // input wire CLK
      .A(inputs[0]),      // input wire [7 : 0] A
      .B(inputs[1]),      // input wire [7 : 0] B
      .C(inputs[2]),      // input wire [7 : 0] C
      .P(out)      // output wire [16 : 0] P
    );
    
    vio_0 your_instance_name (
      .clk(clk),                // input wire clk
      .probe_in0(out),    // input wire [16 : 0] probe_in0
      .probe_out0(inputs[0]),  // output wire [7 : 0] probe_out0
      .probe_out1(inputs[1]),  // output wire [7 : 0] probe_out1
      .probe_out2(inputs[2])  // output wire [7 : 0] probe_out2
    );
endmodule
