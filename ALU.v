module ALU(
   input wire [31:0] operand_a,
	input wire [31:0] operand_b,
	input wire [2:0]  operation,
	input wire        logic_arithmetic,
	input wire        add_sub,
	output reg [31:0] alu_out
);

   always@* begin
	   case(operation)
		   'h0: begin
			   if(!add_sub) begin
				   alu_out = operand_a + operand_b;//ADD
				end
			   else begin
				   alu_out = operand_a - operand_b;//SUB
				end
			end
			'h1: begin
			   alu_out = operand_a << operand_b;//Shift left 
			end	
			'h2: begin//less than signed
			   case({operand_a[31],operand_b[31]})
				   'h1: alu_out = 'h0;
				   'h2: alu_out = 'h1;
					default: alu_out = operand_a < operand_b ?'h1:'h0;
				endcase
			end
			'h3: begin
			   alu_out = (operand_a < operand_b)?'h1:'h0;//less than unsigned
			end
		   'h4: begin
			   alu_out = operand_a ^ operand_b;//XOR
			end
		   'h5: begin
			   if(!logic_arithmetic) begin
				   alu_out = operand_a >> operand_b;
            end
	         else begin			
					case(operand_b)
				      'd0 : alu_out =      operand_a;
					   'd1 : alu_out = {    operand_a[31],operand_a[31:1]};
					   'd2 : alu_out = {{2 {operand_a[31]}},operand_a[31:2]};
					   'd3 : alu_out = {{3 {operand_a[31]}},operand_a[31:3]};
					   'd4 : alu_out = {{4 {operand_a[31]}},operand_a[31:4]};
					   'd5 : alu_out = {{5 {operand_a[31]}},operand_a[31:5]};
					   'd6 : alu_out = {{6 {operand_a[31]}},operand_a[31:6]};
					   'd7 : alu_out = {{7 {operand_a[31]}},operand_a[31:7]};
					   'd8 : alu_out = {{8 {operand_a[31]}},operand_a[31:8]};
					   'd9 : alu_out = {{9 {operand_a[31]}},operand_a[31:9]};
					   'd10: alu_out = {{10{operand_a[31]}},operand_a[31:10]};
					   'd11: alu_out = {{11{operand_a[31]}},operand_a[31:11]};
					   'd12: alu_out = {{12{operand_a[31]}},operand_a[31:12]};
					   'd13: alu_out = {{13{operand_a[31]}},operand_a[31:13]};
					   'd14: alu_out = {{14{operand_a[31]}},operand_a[31:14]};
					   'd15: alu_out = {{15{operand_a[31]}},operand_a[31:15]};
					   'd16: alu_out = {{16{operand_a[31]}},operand_a[31:16]};
					   'd17: alu_out = {{17{operand_a[31]}},operand_a[31:17]};
					   'd18: alu_out = {{18{operand_a[31]}},operand_a[31:18]};
					   'd19: alu_out = {{19{operand_a[31]}},operand_a[31:19]};
					   'd20: alu_out = {{20{operand_a[31]}},operand_a[31:20]};
					   'd21: alu_out = {{21{operand_a[31]}},operand_a[31:21]};
					   'd22: alu_out = {{22{operand_a[31]}},operand_a[31:22]};
					   'd23: alu_out = {{23{operand_a[31]}},operand_a[31:23]};
					   'd24: alu_out = {{24{operand_a[31]}},operand_a[31:24]};
					   'd25: alu_out = {{25{operand_a[31]}},operand_a[31:25]};
					   'd26: alu_out = {{26{operand_a[31]}},operand_a[31:26]};
					   'd27: alu_out = {{27{operand_a[31]}},operand_a[31:27]};
					   'd28: alu_out = {{28{operand_a[31]}},operand_a[31:28]};
					   'd29: alu_out = {{29{operand_a[31]}},operand_a[31:29]};
					   'd30: alu_out = {{30{operand_a[31]}},operand_a[31:30]};
					   'd31: alu_out = {{31{operand_a[31]}},operand_a[31]};
					   default: alu_out = 'hffff_ffff;
				   endcase
				end
		   end
			'h6: begin
			   alu_out = operand_a & operand_b;//AND
			end
			'h7: begin
			   alu_out = operand_a | operand_b;//OR			
			end
		endcase
	end

endmodule 