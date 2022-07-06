module SUB_test;
    reg signed [63:0] input1,input2;
    reg [75:0] i;
    wire signed [63:0] out;
    wire carry_out,overflow_check;
    SUB UUT( .input1(input1), .input2(input2), .out(out) , .carry_out(carry_out), .overflow_check(overflow_check));
    initial begin
            $dumpfile("sub_test.vcd");
            $dumpvars;
            for(i=0;i<4294967295;i = i+1000000) begin
                input1 = i[63:0];
                input2 = i[75:12];
                #2;
                if(overflow_check == 1) begin
                    $display("Overflow occured");
                end
                else begin
                $display("num1 = %d",input1);
                $display("num2 = %d",input2);
                $display("output = %d",out);
                end
            end
            $finish;
    end 
endmodule