`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Description: 4 bit counter with source clock (100MHz) division.

/*

////////////4 bit counter block///////////////////
always @(posedge clk)
begin

if(rst)
begin
counter_out<=4'b0000;
//div_clk <= 1'b0;
end
else
begin
counter_out<= counter_out+1;
end
end

endmodule 



*/

//////////////////////////////////////////////////////////////////////////////////
module counter_clk_div(clk,rst,counter_out);
input clk,rst;
reg div_clk;
reg [25:0] delay_count;
output reg [3:0] counter_out;

//////////clock division block////////////////////


always @(posedge clk)
begin

if(rst)
begin
delay_count<=26'd0;
div_clk <= 1'b0; //initialise div_clk

//uncomment this line while running just the div clock counter for simulation purpose
//counter_out<=4'b0000;  //this will reset the count. If this is commented, the counter will pause, and not reset. Comment this out to see a proper synthesised schematic
end

else
//use a large delay while running just the div clock counter for bitstream purpose. Use a small value for simulation purpose
//if(delay_count==26'd212111223)

if(delay_count==26'd322)
begin
delay_count<=26'd0; //reset upon reaching the max value
div_clk <= ~div_clk;  //generating a slow clock
end
else
begin
delay_count<=delay_count+1;
end
end


/////////////4 bit counter block///////////////////
always @(posedge div_clk)
begin

if(rst)
begin
counter_out<=4'b0000;
end
else
begin
counter_out<= counter_out+1;
end
end

endmodule 
