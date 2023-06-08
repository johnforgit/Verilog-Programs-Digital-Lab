/* full subtractor module */

module fullSub(output reg D,Bout,input X,Y,Bin);
always @ (X or Y or Bin) begin
	if(( X == 1'b0 & Y ==1'b0 & Bin == 1'b0)|
	( X==1'b0 & Y ==1'b1 & Bin == 1'b1)|
	(X == 1'b1 & Y == 1'b0 & Bin == 1'b1)|
	(X == 1'b1 & Y == 1'b1 & Bin == 1'b0))
	begin
		D=1'b0;
	end
	else
		D=1'b1;
	if((X == 1'b0 & Y == 1'b0 & Bin == 1'b0)|
	(X == 1'b1 & Y == 1'b0 & Bin == 1'b0)|
	(X == 1'b1 & Y == 1'b0 & Bin == 1'b1)|
	(X == 1'b1 & Y == 1'b1 & Bin == 1'b0))
	begin
		Bout=1'b0;
	end
	else
		Bout=1'b1;
	end
endmodule

/* testbench module */

module FS_tb;
	reg x,y,bin;
	wire d,bout;
	fullSub fs(d,bout,x,y,bin);
	initial begin
		x=0; y=0; bin=0;
		#1 x = 0; y = 0; bin = 1;
		#1 x = 0; y = 1; bin = 0;
		#1 x = 0; y = 1; bin = 1;
		#1 x = 1; y = 0; bin = 0;
		#1 x = 1; y = 0; bin = 1;
		#1 x = 1; y = 1; bin = 0;
		#1 x = 1; y = 1; bin = 1;
	end
	initial begin
		$monitor("%t | A = %d | B = %d | Borrow In = %d | Difference = %d | Borrow Out = %d",$time,x,y,bin,d,bout);
	end
endmodule
