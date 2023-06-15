/* synchronous testbench module */

`include "synchronous.v"
module sync_tb();
	reg clock, clear, enable;
	reg[0:4] counter;
	wire Y0, Y1, Y2;
	sync i(Y0, Y1, Y2, clock, clear, enable);
	initial begin
		clock = 0; clear=1; counter = 0; enable = 1;
		#1 clear=0;
		while(counter <= 30) begin
			#1 counter +=1;
			clock = counter&1;
		end
	end
	initial begin
		$monitor ("%t | Y2 = %d | Y1 = %d | Y0 = %d", $time, Y2, Y1, Y0);
		$dumpfile("sync.vcd");
		$dumpvars();
	end
endmodule

