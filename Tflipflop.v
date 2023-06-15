/*  T flip-flop module */

module T_flip(output reg Q, input clear, input clock, input T);
	always @(negedge clock or posedge clear) begin
		if(clear == 1)
			Q = 0;
	else begin
		Q = Q ^ T;
	end
	end
	initial begin
		Q = 0;
	end
endmodule

