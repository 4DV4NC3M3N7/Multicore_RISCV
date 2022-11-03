module testbench;
   reg         clk;
	reg         rstn;
   reg  [31:0] operand_a;
	reg  [31:0] operand_b;
	reg  [2:0]  operation;
	reg         add_sub;
	reg         logic_arithmetic;
	wire [31:0] alu_out;
	
	CPU u_CPU (
	   .clk              (clk),
		.rstn             (rstn),
      .operand_a        (operand_a),
	   .operand_b        (operand_b),
	   .operation        (operation),
		.logic_arithmetic (logic_arithmetic),
	   .add_sub          (add_sub),
	   .alu_out          (alu_out)	   
   );
	
   initial begin
	   clk = 1;
		forever
		   #5 clk = ~clk;
	end
	initial begin
      $dumpfile("testbench.vcd");	
		$dumpvars(0,testbench);
	end
	initial begin
	   $monitor("ALU output = 0x%x",alu_out);
	end
	initial begin
	   operand_a = 'h0; operand_b = 'h0; operation = 'h0; logic_arithmetic = 'h0; add_sub = 'h0; rstn = 'h0;
		#10 operand_a = 'h0; operand_b = 'h0; operation = 'h0; logic_arithmetic = 'h0; add_sub = 'h0; rstn = 1;
		#10 operand_a = 'h2; operand_b = 'h1; operation = 'h5; logic_arithmetic = 'h1; add_sub = 'h0; rstn = 1;
		#20;
//		$finish;
	end
endmodule 