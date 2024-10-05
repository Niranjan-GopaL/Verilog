// Combinational logci => requires no clock
// Sequential logic => requires clock


//  When a DFF sees a rising edge of the clock, it registers the data from the Input D to the Output Q


// einput_1 and input_2 are in what is called a sensitivity list. 
// The sensitivity list is a list of all of the signals that will cause the Process/Always Block to execute



module and_gate (
 input_1,
 input_2,
);
    input input_1;
    input input_2;
    reg and_result;


// code 1 and 2 are equivalent 

// -- code 1
assign and_gate = input_1 & input_2;

// -- code 2
always @ (input_1 or input_2)
  begin
    and_result = input_1 & input_2;
  end


endmodule
