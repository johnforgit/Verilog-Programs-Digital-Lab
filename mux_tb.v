/* MUX testbench*/

`include "mux.v"

module muxTest;
	reg A,B,C,D,sel1,sel2;
	wire Y;
	Mux i (Y,A,B,C,D,sel1,sel2);
	initial begin
    	A=1;B=0;C=0;D=0;sel1=0;sel2=0;
    	#1 A=0;B=1;C=0;D=0;sel1=0;sel2=1;
    	#1 A=0;B=0;C=1;D=0;sel1=1;sel2=0;
    	#1 A=0;B=0;C=0;D=1;sel1=1;sel2=1;
	end
	initial begin
    		$monitor("%t A=%d B=%d C=%d D=%d SEL1=%d SEL2=%d Output=%d",$time,A,B,C,D,sel1,sel2,Y);
	end
endmodule
