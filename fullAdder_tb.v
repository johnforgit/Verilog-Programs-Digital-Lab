// full adder test bench

`include "fullAdder.v"
module fa_tb();
reg  A, B, Cin;
wire sum, Cout;  
fullAdder ag(A,B,Cin,sum,Cout);

initial
begin
	A = 0;B = 0;Cin = 0;
	#1 A = 0;B = 0;Cin = 1;
	#1 A = 0;B = 1;Cin = 0;
	#1 A = 0;B = 1;Cin = 1;
	#1 A = 1;B = 0;Cin = 0;
	#1 A = 1;B = 0;Cin = 1;
	#1 A = 1;B = 1;Cin = 0;
	#1 A = 1;B = 1;Cin = 1;

end
initial 
	begin
	$monitor("%t | A = %d | B = %d | Cin = %d | Sum = %d | Cout = %d |", $time, A, B, Cin, sum, Cout);
end
endmodule
