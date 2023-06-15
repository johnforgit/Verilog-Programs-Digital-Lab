/* Asynchronous counter module */

`include "Tflipflop.v"
module async_dec(output Q0, Q1, Q2, Q3, input clock, input clear_in);
	wire clear;

	assign clear = clear_in | (Q3 & Q1);
	T_flip a(Q0, clear, clock, 1'b1);
	T_flip b(Q1, clear, Q0, 1'b1);
	T_flip c(Q2, clear, Q1, 1'b1);
	T_flip d(Q3, clear, Q2, 1'b1);

endmodule


/* Asynchronous test module */

`include "asynchronous.v"
module async_dec_tb();
	reg clock, clear;
	reg[0:4] counter;
	wire Y0, Y1, Y2, Y3;
	async_dec i(Y0, Y1, Y2, Y3, clock, clear);
	initial begin
		clock = 0; clear=1; counter = 0;
		#1 clear=0;
		while(counter <= 30) begin
			#1 counter +=1;
			clock = counter&1;
		end
	end
	initial begin
		$monitor ("%t | Y3 = %d | Y2 = %d | Y1 = %d | Y0 = %d clear=%d", $time, Y3, Y2, Y1, Y0,clear);
		$dumpfile("async.vcd");
		$dumpvars();
	end
endmodule

