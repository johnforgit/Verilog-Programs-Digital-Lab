/* testbench module */

`include "demux.v"
module demuxtest;
	reg in,s1,s2;
	wire A,B,C,D;
	demux i (A,B,C,D,in,s1,s2);
	initial begin
    		in=1;s1=0;s2=0;
    		#1 in=1;s1=0;s2=1;
    		#1 in=1;s1=1;s2=0;
    		#1 in=1;s1=1;s2=1;
	end
initial begin
    $monitor("%t Input = %d Select1 = %d Select2 = %d A = %d B = %d C = %d D = %d",$time,in,s1,s2,A,B,C,D);
end
endmodule
