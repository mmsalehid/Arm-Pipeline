module IF_stage(input clk, rst, freeze, branch_taken,
                input[31:0] branch_addr,
                output[31:0] pc, instruction);
    

    //PC
    reg [31:0] pc_out_reg;
    wire[31:0] pc_out;
    wire [31:0] pc_in;
    always@(posedge clk,posedge rst) begin
        if (rst)
            pc_out_reg = 32'b0;
        else if(~freeze)
            pc_out_reg <= pc_in;
        else pc_out_reg <= pc_out;
    end
    assign pc_out = pc_out_reg;

    //Instruction Memory
    reg [31:0] instruction_reg;
    always @(*) begin
        case (pc_out)
            32'd0  : instruction_reg <= 32'b00000000001000100000000000000000; 
            32'd4  : instruction_reg <= 32'b00000000011001000000000000000000;
            32'd8  : instruction_reg <= 32'b00000000101001100000000000000000;
            32'd12 : instruction_reg <= 32'b00000000111010000001000000000000;
            32'd16 : instruction_reg <= 32'b00000001001010100001100000000000;
            32'd20 : instruction_reg <= 32'b00000001011011000000000000000000;
            32'd24 : instruction_reg <= 32'b00000001101011100000000000000000;
        endcase
    end
    assign instruction = instruction_reg;


    //MUX
    assign pc_in = branch_taken ? branch_addr : pc_out + 32'd4;

    //Adder
    assign pc = pc_out+32'd4;
            

endmodule