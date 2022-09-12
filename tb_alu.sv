
module tb_alu();
   parameter dw = 32;
   logic [dw-1:0] A;
   logic [dw-1:0] B;
   logic [1:0] alu_control;
   logic [dw-1:0] y;

   alu # (.DW(dw))
   my_alu_dut(.A(A), .B(B), .alu_control(alu_control), .y(y));

   initial begin
      A = 0;
      B = 5;
      alu_control = 2'b00;
      #5; alu_control = 2'b11;
      #5; alu_control = 2'b10;
      #5; alu_control = 2'b01;
      #5; alu_control = 2'b00;
      #5; A = 10; B = 20;
      #5; alu_control = 2'b11;
      #5; alu_control = 2'b10;
      #5; alu_control = 2'b01;
      #5; alu_control = 2'b00;
   
   end

   initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
   end

   initial begin
      $monitor("A = %d,    B = %d    alu_control = %d    y = %d", A, B, alu_control, y);
   end
endmodule


