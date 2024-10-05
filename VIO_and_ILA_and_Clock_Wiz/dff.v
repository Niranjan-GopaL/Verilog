module DFF (my_clk);

    input my_clk; 

    // Change all inputs to wire ( the will come from output of vio )
    wire D;  
    wire rst; 

    // Change outputs as reg
    reg Q;

  
clk_wiz_0 my_clock_instance(
    // Clock out ports
    .half_clock(my_half_clock),     // output half_clock

   // Clock in ports
    .clk_in1(my_clk)            // input clk_in1 comes directly from FPGA
);

vio_0 vio_1 (
  .clk(my_clk),     
  
  .probe_in0(Q),    
  .probe_out0(rst), 
  .probe_out1(D)    
);

ila_0 ila_1 (
	.clk(my_clk),

	.probe0(rst),
	.probe1(D), 
	.probe2(Q) ,
	.probe3(my_half_clock) 
);




    // On +ve clock edge, if reset is high, reset the output. Otherwise, follow D input.
    
    // we use the half_clock to drive the Flip Flop
    always @(posedge my_half_clock or posedge rst) begin
        if (rst)
            Q <= 1'b0;  // Resets output to 0
        else
            Q <= D;     // Set Q to the input D
    end

endmodule