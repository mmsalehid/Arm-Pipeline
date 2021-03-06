module IF_stage_reg(
    input clk, rst, freeze, flush,
    input[31:0] pc_in, instruction_in,
    output reg [31:0] pc, instruction
);
    always@(posedge clk,posedge rst) begin
        if (rst )begin
            pc = 32'b0;
            instruction = 32'b0;
        end
        else if(flush)begin
            pc = 32'b0;
            instruction = 32'b0;
        end
        else begin
            pc <= pc_in;
            instruction <= instruction_in;
        end
    end

endmodule