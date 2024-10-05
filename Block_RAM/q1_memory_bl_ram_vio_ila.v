`timescale 1ns/1ps
//Read from memory and display

module memorymodule(clk);
wire [7:0] data,din;
reg ena,wea;
input clk;
wire reset; //i/p--wire
reg [7:0] memory[0:7]; //declare an 8-byte memory
reg [2:0] address;
integer file1;

vio_0 your_instance_name (
  .clk(clk),                // input wire clk
  .probe_in0(data),    // input wire [7 : 0] probe_in0
  .probe_out0(reset)  // output wire [0 : 0] probe_out0
);

ila_0 instance_name1 (
	.clk(clk), // input wire clk
	.probe0(clk), // input wire [0:0]  probe0  
	.probe1(data), // input wire [7:0]  probe1 
	.probe2(address) // input wire [2:0]  probe2
);


//1st step - Add block RAM
blk_mem_gen_0 mem_instance_name (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(address),  // input wire [2 : 0] addra
  .dina(din),    // input wire [7 : 0] dina
  .douta(data)  // output wire [7 : 0] douta
);

initial
begin
ena=1;
wea=0; //read only
address=3'b000;
//read memory file init.dat. address locations given in memory starting with @
//$readmemb("init.dat", memory);
/*
memory[0]=8'b00000000;
memory[1]=8'b00111110;
memory[2]=8'b00000000;
memory[3]=8'b00001100;
memory[4]=8'b00000000;
memory[5]=8'b00011000;
memory[6]=8'b00000000;
memory[7]=8'b01100000;
*/
end


always @(posedge clk)
//display contents of initialized memory
begin

if(reset)
 address=3'b000;
else
	begin
	//data=memory[address];
	//$display("Memory [%0d] = %b", address, data);
	address=address+3'b001;
	end

end
//$fdisplay(file1,"Memory [%0d] = %b", address,data);
//$fclose(file1);
endmodule


//testbench


/*
module testmemory;
reg clk, reset;
wire [7:0] data;
memorymodule uut (.clk(clk),.data(data),.reset(reset));


initial
begin
clk=0;
reset=1;
#10;
reset=0;
$dumpfile ("mem_out.vcd"); 
$dumpvars(0,testmemory);
end

always 
begin
#10 clk=~clk;
end


endmodule
*/
