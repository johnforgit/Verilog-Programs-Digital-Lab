// half adder module using behavorial method

module HAbh(A,B,sum,Cout);
	input A,B;
	output reg sum,Cout;
	always @(A or B) begin
		if(A != B)
			begin
				sum = 1'b1;
			end
		else 
			sum = 1'b0;
		if(A == 1'b1 && B == 1'b1)
			begin 
				Cout = 1'b1;
			end
		else
			Cout = 1'b0;
	end
endmodule

module HAbh_tb();
	reg a, b;
	wire sum, cout;
	HAbh half(a,b,sum,cout);
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
