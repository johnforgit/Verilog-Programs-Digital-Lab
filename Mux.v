/* MUX MODULE IN BEHAVIORAL MODEL */

module Mux(output reg q,input A,B,C,D,select1,select2);
always @(A or B or C or D or select1 or select2) begin
    if(select1 == 1'b0 & select2 == 1'b0)
        assign q = A;
    if(select1 == 1'b0 & select2 == 1'b1)
        assign q = B;
    if(select1 == 1'b1 & select2 == 1'b0)
        assign q = C;
    if(select1 == 1'b1 & select2 == 1'b1)
        assign q = D;
end
endmodule

/* TESTBENCH MODULE */

module Muxtb;
	reg a,b,c,d,Sel1,Sel2;
	wire y;
	Mux i (y,a,b,c,d,sel1,sel2);
	initial begin
    		a = 1; b = 0; c = 0; d = 0; Sel1 = 0; Sel2 = 0;
    		#1 a = 0; b = 1; c = 0; d = 0; Sel1 = 0; Sel2 = 1;
    		#1 a = 0; b = 0; c = 1; d = 0; Sel1 = 1; Sel2 = 0;
    		#1 a = 0; b = 0; c = 0; d = 1; Sel1 = 1; Sel2 = 1;
	end 
	initial begin
    		$monitor("%t | A = %d| B = %d | C = %d | D = %d | SEL1 = %d | SEL2 = %d | Output = %d |",$time,a,b,c,d,Sel1,Sel2,y);
	end
endmodule
