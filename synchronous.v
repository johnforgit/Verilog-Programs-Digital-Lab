/* synchronous counter module */

`include "Tflipflop.v"
module sync(output Q0, Q1, Q2, input clock, input clear, input enable);
	wire clear, T1, T2;
	reg up;
	assign T1 = (up & (Q0 & enable)) | (~up & (~Q0 & enable));
	assign T2 = (up & (Q0 & Q1 & enable)) | (~up & (~Q0 & ~Q1 & enable));
	
	T_flip a(Q0, clear, clock, enable);
	T_flip b(Q1, clear, clock, T1);
	T_flip c(Q2, clear, clock, T2);
	
	always @(clear) begin
		if(clear == 1)
			up = 1;
	end

	always @(clock) begin
		if(up == 1 && {Q2, Q1, Q0} == 3'b111)
			up = 0;
		else if(up == 0 && {Q2, Q1, Q0} == 3'b000)
			up = 1;
	end
endmodule

