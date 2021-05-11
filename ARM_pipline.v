module ARM_pipeline(
    input clk, rst
);
    wire freeze, branch_taken;
    wire[31:0] branch_addr, instruction, instruction_out, pc, pc_IF_out, pc_ID, pc_ID_out, pc_EXE, pc_EXE_out, pc_MEM, pc_MEM_out, pc_WB;
    assign freeze = 1'b0;
    assign branch_taken = 1'b0;
    assign branch_addr = 32'd0;
    assign flush = 1'b0;
    
    
    IF_stage if_stage(clk, rst, freeze, branch_taken, branch_addr, instruction, pc);
    IF_stage_reg if_stage_reg(clk, rst, freeze, flush, pc, instruction, pc_IF_out, instruction_out);
    ID_stage id_stage(clk, rst, pc_IF_out, pc_ID);
    ID_stage_reg id_stage_reg(clk, rst, pc_ID, pc_ID_out);
    EXE_stage exe_stage(clk, rst, pc_ID_out, pc_EXE);
    EXE_stage_reg exe_stage_reg(clk, rst, pc_EXE, pc_EXE_out);
    MEM_stage mem_stage(clk, rst, pc_EXE_out, pc_MEM);
    MEM_stage_reg mem_stage_reg(clk, rst, pc_MEM, pc_MEM_out);
    WB_stage wb_stage(clk, rst, pc_MEM_out, pc_WB);


endmodule