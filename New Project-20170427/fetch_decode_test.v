module decode_test(); 

reg clk; 
wire [31:0] instruction; 
wire [31:0] PC_in; 

wire [31:0] PC_out; 
wire[31:0] branch_offset; 

wire[4:0] rs, rt, rd;
wire [3:0] alu_op;
wire [4:0] shamt; 
wire [5:0] funct, opcode;  
wire  alu_source, mem_to_reg, mem_read, mem_write, reg_write, branch_flag, reg_dest;  

initial begin clk = 0; forever #10 clk = ~clk; end 
initial #200 $finish; 
fetch f(clk, instruction, PC_in, 0, 1'b0);

 decode d(rs, rt, rd, shamt,alu_source, alu_op, mem_to_reg, mem_read, mem_write, reg_write,
		 branch_flag, branch_offset, reg_dest, funct, opcode, PC_out, clk, instruction, PC_in);
		 
always @ (rs or rt or rd or shamt or alu_source or alu_op or mem_to_reg or mem_read or mem_write or reg_write or
		 branch_flag or branch_offset or alu_source or mem_to_reg or mem_read or mem_write or reg_write or branch_flag or 
		 reg_dest or funct or opcode or PC_out) 
		 $monitor("rs = %d, rt = %d, rd = %d, shamt = %d, alu_source = %d, alu_op = %d, mem_to_reg = %d, mem_read = %d, \n mem_write = %d, reg_write = %d, branch_flag = %d, branch_offset = %d, reg_dest = %d, funct = %d, opcode = %d, PC_out = %d",
		 rs, rt, rd, shamt,alu_source, alu_op, mem_to_reg, mem_read, mem_write, reg_write,
		 branch_flag, branch_offset, reg_dest, funct, opcode, PC_out); 
endmodule 
