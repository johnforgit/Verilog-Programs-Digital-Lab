/* testbench module */

`include "HAbh.v"

module Full;
	reg A,B,C1;
	wire sum,carry;
	Half i (sum1,carry1,A,B);
	Half j (sum,carry2,sum1,C1);
	or(carry,carry1,carry2);
	initial begin
    		A=0;B=0;C1=0;
    		#1 A=0;B=0;C1=1;
    		#1 A=0;B=1;C1=0;
    		#1 A=0;B=1;C1=1;
    		#1 A=1;B=0;C1=0;
    		#1 A=1;B=0;C1=1;
    		#1 A=1;B=1;C1=0;
    		#1 A=1;B=1;C1=1;
	end
initial begin
    $monitor("%t A=%d B=%d C=%d Sum=%d Carry=%d",$time,A,B,C1,sum,carry);
end
endmodule

