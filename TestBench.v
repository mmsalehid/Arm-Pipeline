module TB();
    reg clk = 1,rst;
    ARM_pipeline PL(clk,rst);
    always #50 clk = ~clk;
    
    initial begin
        rst = 1;
        #100
        rst = 0;
        #30000
        $stop;
    end


endmodule 