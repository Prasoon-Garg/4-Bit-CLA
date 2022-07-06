module ADD_test;
    reg signed [63:0] input1,input2;
    reg [75:0] i;
    reg c_in = 0;
    wire signed [63:0] out;
    wire carry_out,overflow_check;
    ADD UUT( .input1(input1), .input2(input2), .c_in(c_in), .out(out) , .carry_out(carry_out), .overflow_check(overflow_check));
    initial begin
            $dumpfile("add_test.vcd");
            $dumpvars;
            for(i=0;i<4294967295;i = i+1000000) begin
                input1 = i[63:0];
                input2 = i[75:12];
                #5;
                if(overflow_check == 1) begin
                    $display("Overflow occured");
                end
                else begin
                $display("%d",input1);
                $display("%d",input2);
                $display("%d",out);
                end
            end
            $finish;
    end
endmodule