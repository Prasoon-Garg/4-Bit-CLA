module XOR_test;
    reg [63:0] input1,input2;
    reg [75:0] i;
    wire [63:0] out;
    XOR UUT( .input1(input1), .input2(input2), .out(out));
    initial begin
            $dumpfile("xor_test.vcd");
            $dumpvars;
            for(i=0;i<4294967295;i = i+1000000) begin
                input1 = i[63:0];
                input2 = i[75:12];
                #5;
                $display("%b",input1);
                $display("%b",input2);
                $display("%b\n",out);
            end
            $finish;
    end
endmodule