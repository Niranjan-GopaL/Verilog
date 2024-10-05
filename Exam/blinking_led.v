module  blink(
    input clk,
    output reg led1,
    output reg led2,
    output reg led3
    );

reg [31:0]count;
reg [2:0]inner_count;


//  ----------------------- MOST important part of the code -------------------------------------- 
    initial begin
        count = 0;
        led1=0;
        led2=0;
        led3=0;
        inner_count = 2'b00;
    end

    always @(posedge clk) begin

        if(count == 32'h3211111) begin // 1 second value 
            count <= 0; 
            
            if (inner_count != 2'b11 )
                inner_count = inner_count + 1;
            else
                inner_count <= 0;
    
            if (inner_count % 3 == 0) begin
                led1 = 1; led2 = 0; led3 = 0;
                end
            if (inner_count % 3 == 1) begin
                led1 = 0; led2 = 1; led3 = 0;
                end
            if (inner_count % 3 == 2) begin 
                led1 = 0; led2 = 0; led3 = 1;
                end

        else 
            count <= count + 1; //Counts 100MHz clock
    end
end
//  -------------------------------------------------------------------------------------------------------------



endmodule
