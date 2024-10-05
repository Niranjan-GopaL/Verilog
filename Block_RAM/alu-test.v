

`timescale 1ns/1ps
module alu_test;

reg clk;
reg [1:0]  sel; //input converted to wire
reg [17:0] A, B, D;
reg [47:0] C;
wire [47:0] P;
reg CARRYIN;

alu uut (A,B,C,D, CARRYIN, sel, P, clk); 

initial
begin

A= 18'h0000b;
B= 18'h00003;
D= 18'h00003;
C=18'h00001;
//C= 48'h00101145679A;
clk=0;
sel= 2'b00;
CARRYIN=0;

end


always
begin
#3 clk=~clk;
end

always @(posedge clk)
begin

#10 sel = 5'b01;
#10 sel = 5'b10;
#10 sel = 5'b11;


end

endmodule

