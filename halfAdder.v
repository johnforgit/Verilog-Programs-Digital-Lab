// half adder module

module halfAdder(A,B,sum,Cout);
	input A,B;
	output sum,Cout;
	assign sum = A^B;
	assign Cout = A&B;
endmodule
