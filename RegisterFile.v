module RegisterFile(input clk,input rst,
                    input [3:0] src1,src2,dest_wb,
                    input [31:0] result_wb,input wb_en,output [31:0] reg1,reg2);
    reg [31:0] regs [14:0];
    assign reg1 = regs[src1];
    assign reg2 = regs[src2];
    always@(negedge clk,posedge rst) begin
        if(rst) begin : RESET
            integer i;
            for (i = 0; i <15;i = i + 1)
                regs[i] = i;
        end
        if(wb_en) begin
            regs[dest_wb] <= result_wb;
            regs[0] = 0;
            
        end
    end
endmodule