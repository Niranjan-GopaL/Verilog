`timescale 1ns / 1ps

module counter_clk_div(clk,reset,count);

    input clk,reset;
    output reg [3:0] count = 4'b0000;
    reg [25:0] count_reg;
    reg clk_div = 1'b0;

always @ (posedge clk)
begin
if (reset)
    begin
        clk_div <= 1'b0;
        count_reg <= 26'd0;
     end
else
    begin
        count_reg <= count_reg + 1;
        if (count_reg == 26'h32211111) // for bitstream
    //   if (count_reg == 26'd12) // for simulation
        begin
            clk_div <= ~ clk_div;
            count_reg <= 26'd0;
        end
    end
 end
  
 always @ (posedge clk_div)
 begin
 if (reset)
 begin
    count <= 4'b0000;
 end
 else
 begin
    count <= count + 1;
 end
 end

endmodule
