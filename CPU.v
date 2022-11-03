module CPU(
   input wire        clk,
	input wire        rstn,
   input wire [31:0] operand_a,
	input wire [31:0] operand_b,
	input wire [2:0]  operation,
	input wire        logic_arithmetic, 
	input wire        add_sub,
	output reg [31:0] alu_out
);
   reg  [31:0] buf_operand_a;
	reg  [31:0] buf_operand_b;
	reg  [2:0]  buf_operation;
	reg         buf_logic_arithmetic;
	reg         buf_add_sub;
	wire [31:0] buf_alu_out;
	always@(posedge clk or negedge rstn) begin
	   if(!rstn) begin
		   buf_operand_a        <= 'h0;
			buf_operand_b        <= 'h0;
			buf_operation        <= 'h0;
			buf_logic_arithmetic <= 'h0;
			buf_add_sub          <= 'h0;
			alu_out              <= 'h0;
		end
		else begin
		   buf_operand_a 		   <= operand_a;
			buf_operand_b 		   <= operand_b;
			buf_operation 		   <= operation;
			buf_logic_arithmetic <= logic_arithmetic;
			buf_add_sub   		   <= add_sub;
			alu_out       		   <= buf_alu_out;		
		end
	end
//--------------------------------------------------   
	ALU u_ALU (
      .operand_a        (buf_operand_a),
	   .operand_b        (buf_operand_b),
	   .operation        (buf_operation),
		.logic_arithmetic (buf_logic_arithmetic), 
	   .add_sub          (buf_add_sub),
	   .alu_out          (buf_alu_out)	   
   );
//--------------------------------------------------
	
endmodule 