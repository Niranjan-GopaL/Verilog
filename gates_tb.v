`include "gates.v"


module gates_tb();
    reg a, b;
    wire  out;

    xor_gate G1(a,b,out) ;

    initial begin

    $dumpfile("gates_tb.vcd") ;
    $dumpvars(0, gates_tb) ;

       a = 0; b=0; #10; 
       a = 0; b=1; #10; 
       a = 1; b=0; #10; 
       a = 1; b=1; #10; 
    end
endmodule