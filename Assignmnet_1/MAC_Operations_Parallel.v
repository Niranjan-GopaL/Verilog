`timescale 1ns / 1ps

module MAC_Operations_Parallel(clk);
    input clk;
    wire [16:0] P0;
    wire [16:0] P1;
    wire [16:0] P2;
    wire [16:0] P3;
    wire [16:0] P4;
    wire [16:0] P5;
    wire [16:0] P6;
    wire [16:0] P7;
    wire [16:0] P8;
    wire [16:0] P9;
    
    
    reg [1:0] address;
    reg wea, ena;
    reg [79:0] data_in;
    
    wire [79:0] a;
    wire [79:0] b;
    wire [79:0] c;
    
    
    // Creting the block RAMs
    blk_mem_gen_0 mem0 (
      .clka(clk),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(address),  // input wire [3 : 0] addra
      .dina(data_in),    // input wire [7 : 0] dina
      .douta(a)  // output wire [7 : 0] douta
    );
    
    blk_mem_gen_1 mem1 (
      .clka(clk),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(address),  // input wire [3 : 0] addra
      .dina(data_in),    // input wire [7 : 0] dina
      .douta(b)  // output wire [7 : 0] douta
    );
    
    blk_mem_gen_2 mem2 (
      .clka(clk),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(address),  // input wire [3 : 0] addra
      .dina(data_out),    // input wire [7 : 0] dina
      .douta(c)  // output wire [7 : 0] douta
    );
    
    dsp_macro_1 dsp1 (
      .CLK(clk),  // input wire CLK
      .A(a[79:72]),      // input wire [7 : 0] A
      .B(b[79:72]),      // input wire [7 : 0] B
      .C(c[79:72]),      // input wire [7 : 0] C
      .P(P0)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp2 (
      .CLK(clk),  // input wire CLK
      .A(a[71:64]),      // input wire [7 : 0] A
      .B(b[71:64]),      // input wire [7 : 0] B
      .C(c[71:64]),      // input wire [7 : 0] C
      .P(P1)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp3 (
      .CLK(clk),  // input wire CLK
      .A(a[63:56]),      // input wire [7 : 0] A
      .B(b[63:56]),      // input wire [7 : 0] B
      .C(c[63:56]),      // input wire [7 : 0] C
      .P(P2)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp4 (
      .CLK(clk),  // input wire CLK
      .A(a[55:48]),      // input wire [7 : 0] A
      .B(b[55:48]),      // input wire [7 : 0] B
      .C(c[55:48]),      // input wire [7 : 0] C
      .P(P3)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp5 (
      .CLK(clk),  // input wire CLK
      .A(a[47:40]),      // input wire [7 : 0] A
      .B(b[47:40]),      // input wire [7 : 0] B
      .C(c[47:40]),      // input wire [7 : 0] C
      .P(P4)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp6 (
      .CLK(clk),  // input wire CLK
      .A(a[39:32]),      // input wire [7 : 0] A
      .B(b[39:32]),      // input wire [7 : 0] B
      .C(c[39:32]),      // input wire [7 : 0] C
      .P(P5)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp7 (
      .CLK(clk),  // input wire CLK
      .A(a[31:24]),      // input wire [7 : 0] A
      .B(b[31:24]),      // input wire [7 : 0] B
      .C(c[31:24]),      // input wire [7 : 0] C
      .P(P6)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp8 (
      .CLK(clk),  // input wire CLK
      .A(a[23:16]),      // input wire [7 : 0] A
      .B(b[23:16]),      // input wire [7 : 0] B
      .C(c[23:16]),      // input wire [7 : 0] C
      .P(P7)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp9 (
      .CLK(clk),  // input wire CLK
      .A(a[15:8]),      // input wire [7 : 0] A
      .B(b[15:8]),      // input wire [7 : 0] B
      .C(c[15:8]),      // input wire [7 : 0] C
      .P(P8)      // output wire [16 : 0] P
    );
    dsp_macro_1 dsp10 (
      .CLK(clk),  // input wire CLK
      .A(a[7:0]),      // input wire [7 : 0] A
      .B(b[7:0]),      // input wire [7 : 0] B
      .C(c[7:0]),      // input wire [7 : 0] C
      .P(P9)      // output wire [16 : 0] P
    );
    
    ila_0 your_instance_name (
	.clk(clk), // input wire clk

	.probe0(address), // input wire [1:0]  probe0  
	.probe1(a[79:72]), // input wire [6:0]  probe1 
	.probe2(b[79:72]), // input wire [6:0]  probe2 
	.probe3(c[79:72]), // input wire [6:0]  probe3 
	.probe4(P0), // input wire [16:0]  probe4 
	.probe5(a[71:64]), // input wire [6:0]  probe5 
	.probe6(b[71:64]), // input wire [6:0]  probe6 
	.probe7(c[71:64]), // input wire [6:0]  probe7 
	.probe8(P1), // input wire [16:0]  probe8 
	.probe9(a[63:56]), // input wire [6:0]  probe9 
	.probe10(b[63:56]), // input wire [6:0]  probe10 
	.probe11(c[63:56]), // input wire [6:0]  probe11 
	.probe12(P2), // input wire [16:0]  probe12 
	.probe13(a[55:48]), // input wire [6:0]  probe13 
	.probe14(b[55:48]), // input wire [6:0]  probe14 
	.probe15(c[55:48]), // input wire [6:0]  probe15 
	.probe16(P3), // input wire [16:0]  probe16 
	.probe17(a[47:40]), // input wire [6:0]  probe17 
	.probe18(b[47:40]), // input wire [6:0]  probe18 
	.probe19(c[47:40]), // input wire [6:0]  probe19 
	.probe20(P4), // input wire [16:0]  probe20 
	.probe21(a[39:32]), // input wire [6:0]  probe21 
	.probe22(b[39:32]), // input wire [6:0]  probe22 
	.probe23(c[39:32]), // input wire [6:0]  probe23 
	.probe24(P5), // input wire [16:0]  probe24 
	.probe25(a[31:24]), // input wire [6:0]  probe25 
	.probe26(b[31:24]), // input wire [6:0]  probe26 
	.probe27(c[31:24]), // input wire [6:0]  probe27 
	.probe28(P6), // input wire [16:0]  probe28 
	.probe29(a[23:16]), // input wire [6:0]  probe29 
	.probe30(b[23:16]), // input wire [6:0]  probe30 
	.probe31(c[23:16]), // input wire [6:0]  probe31 
	.probe32(P7), // input wire [16:0]  probe32 
	.probe33(a[15:8]), // input wire [6:0]  probe33 
	.probe34(b[15:8]), // input wire [6:0]  probe34 
	.probe35(c[15:8]), // input wire [6:0]  probe35 
	.probe36(P8), // input wire [16:0]  probe36 
	.probe37(a[7:0]), // input wire [6:0]  probe37 
	.probe38(b[7:0]), // input wire [6:0]  probe38 
	.probe39(c[7:0]), // input wire [6:0]  probe39 
	.probe40(P9) // input wire [16:0]  probe40
);


    initial
        begin
            address = 4'b0000;
            wea = 0;
            ena = 1;
        end
    always @(posedge clk)
    begin
        if (address == 4'b0001)
            address <= 4'b0000;  // Hold the address if it's 0000
        else
            address <= address + 4'b0001;  // Increment address otherwise
    end

            

endmodule
