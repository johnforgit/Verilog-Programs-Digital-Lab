/* gates testbench module */

`include "gates.v"

module Test;
	reg A,B;
	wire Y1,Y2,Y3,Y4,Y5;
	andBehav i1 (Y1,A,B);
	orBehav i2 (Y2,A,B);
	norBehav i3 (Y3,A,B);
	nandBehav i4 (Y4,A,B);
	xorBehav i5 (Y5,A,B);
	initial begin
    		A=0;B=0;
    		#1 A=0;B=1;
    		#1 A=1;B=0;
    		#1 A=1;B=1;
	end
	initial begin
    		$monitor("%t A=%d B=%d AND=%d OR=%d NOR=%d NAND=%d XOR=%d",$time,A,B,Y1,Y2,Y3,Y4,Y5);
	end
endmodule
