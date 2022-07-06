module alu_test;
    reg signed [63:0] input1=0,input2=0;
    reg c_in = 0;
    reg [75:0] i;
    reg [1:0]control = 0;
    wire signed [63:0] alu_out;
    wire alu_carry_out,alu_overflow_check;
    alu UUT( .control(control), .input1(input1), .input2(input2), .alu_out(alu_out) , .alu_carry_out(alu_carry_out), .alu_overflow_check(alu_overflow_check));
    initial begin
            $dumpfile("alu_test.vcd");
            $dumpvars;
            for(i=0;i<42949670;i = i+1000000) begin
                control = 0;
                input1 = i[63:0];
                input2 = i[75:12];
                #2;
                if(alu_overflow_check == 1) begin
                    $display("Overflow occured");
                end
                else begin
                $display("%d",control);
                $display("%d",input1);
                $display("%d",input2);
                $display("%d",alu_out);
                end

                control = 1;
                #2;
                if(alu_overflow_check == 1) begin
                    $display("Overflow occured");
                end
                else begin
                $display("%d",control);
                $display("%d",input1);
                $display("%d",input2);
                $display("%d",alu_out);
                end

                control = 2;
                #2;
                if(alu_overflow_check == 1) begin
                    $display("Overflow occured");
                end
                else begin
                $display("%d",control);
                $display("%d",input1);
                $display("%d",input2);
                $display("%d",alu_out);
                end

                control = 3;
                #2;
                if(alu_overflow_check == 1) begin
                    $display("Overflow occured");
                end
                else begin
                $display("%d",control);
                $display("%d",input1);
                $display("%d",input2);
                $display("%d",alu_out);
                end
                #2;

                end
    end
endmodule