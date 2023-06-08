/* half subtractor in behavioral model */

module halfSub(input X, Y, output reg D,B);
	always @(X or Y) begin
		if (X == 1'b0 && Y == 1'b1) 
		begin
			D = 1'b1;
			B = 1'b1;
		end
		else if (X == 1'b1 && Y == 1'b0) 
		begin
			D = 1'b1;
			B = 1'b0;
		end
		else if (X == 1'b1 && Y == 1'b1) 
		begin
			D = 1'b0;
			B = 1'b0;
		end
		else 
		begin
			D = 1'b0;
			B = 1'b0;
		end
	end
endmodule

/* testbench module */

module HS_tb;
	reg m, n;
	wire d, b;
	halfSub hs(m, n, d, b);
	initial begin
		m = 0; n = 0;
		#1 m = 0; n = 1;
		#1 m = 1; n = 0;
		#1 m = 1; n = 1;
	end
	initial begin
		$monitor("%t | A = %d | B = %d | Difference = %d | Borrow = %d |", $time, m, n, d, b);
	end
endmodule

