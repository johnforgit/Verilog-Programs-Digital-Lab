// half adder test bench

`include "halfAdder.v"
module half_tb();
	reg a, b;
	wire sum, cout;
	halfAdder half(a,b,sum,cout);
	initial begin 
		a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
	initial begin
		$monitor("%t | A = %d | B = %d | Sum = %d | Carry out = %d |",$time, a, b, sum, cout);
	end
endmodule
	

