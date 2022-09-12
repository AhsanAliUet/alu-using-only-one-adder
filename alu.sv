
//ALU using only one adder, which can add as well as subtract using only that one adder
module alu # (
   parameter DW = 32
)(
   input [DW-1:0] A,
   input [DW-1:0] B,
   input [1:0] alu_control,
   output logic [DW-1:0] y

);

logic [DW-1:0] add_out;       //Output of the adder (or subtractor)
logic [DW-1:0] b;

always_comb begin
   if (alu_control[0]) begin              //taking its complement if we want to subtract
      b = ~B;
   end else begin
      b = B;
   end

end

always_comb begin
   assign add_out = A + b + alu_control[0];       //Full adder output
end

always_comb begin
   case(alu_control)                       //Mux to choose one of the operations
      2'b00: y = add_out;
      2'b01: y = add_out;
      2'b10: y = A & B;
      2'b11: y = A | B;
   endcase
end

endmodule